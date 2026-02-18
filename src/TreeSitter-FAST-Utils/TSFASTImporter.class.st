Class {
	#name : 'TSFASTImporter',
	#superclass : 'TSVisitor',
	#instVars : [
		'tsLanguage',
		'classesPrefix',
		'model',
		'originString',
		'containedEntitiesPropertiesMap',
		'context',
		'currentField',
		'currentFMProperty'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'accessing' }
TSFASTImporter >> classesPrefix [

	^ classesPrefix
]

{ #category : 'private' }
TSFASTImporter >> containedEntitiePropertiesFor: aClass [
	"I am a cache to know for a FAST class the list of Fame properties they have to define a contained entity."

	^ containedEntitiesPropertiesMap at: aClass ifAbsentPut: [ aClass mooseDescription allProperties select: #isChildrenProperty ]
]

{ #category : 'actions' }
TSFASTImporter >> import: aTSNode [

	| rootFastEntity |
	model := self newInstanceOfClassNamed: self classesPrefix , 'Model'.
	rootFastEntity := aTSNode accept: self.
	rootFastEntity source: self originString.
	^ model
]

{ #category : 'initialization' }
TSFASTImporter >> initialize [

	super initialize.
	containedEntitiesPropertiesMap := IdentityDictionary new.
	context := Stack new
]

{ #category : 'actions' }
TSFASTImporter >> instantiateFastEntityFrom: aTSNode [
	"We instantiate the right class, add it to the model and set the sources positions."

	| fastEntity |
	fastEntity := self newInstanceOfClassNamed: self classesPrefix , aTSNode type pascalized.

	model add: fastEntity.
	fastEntity startPos: (aTSNode startPositionFromSourceText: self originString).
	fastEntity endPos: (aTSNode endPositionFromSourceText: self originString).

	^ fastEntity
]

{ #category : 'accessing' }
TSFASTImporter >> languageName: aString [

	classesPrefix := 'FAST' , aString
]

{ #category : 'accessing' }
TSFASTImporter >> newInstanceOfClassNamed: aString [

	^ (aString asClassInEnvironment: self class environment) new
]

{ #category : 'accessing' }
TSFASTImporter >> originString [

	^ originString
]

{ #category : 'accessing' }
TSFASTImporter >> originString: anObject [

	originString := anObject
]

{ #category : 'accessing' }
TSFASTImporter >> tsLanguage [

	^ tsLanguage
]

{ #category : 'accessing' }
TSFASTImporter >> tsLanguage: anObject [

	tsLanguage := anObject
]

{ #category : 'visiting' }
TSFASTImporter >> visitChildren: aTSNode in: fastEntity [
	"Now we will visit the children after adding myself as the top context so that they can find their parent."

	context push: fastEntity.
	
	aTSNode collectFieldNameOfNamedChild keysAndValuesDo: [ :field :nodes |
			"If the field has the name of a property, we save this property so that my children can use it to set themselves in the right variable"
			(self containedEntitiePropertiesFor: fastEntity class)
				detect: [ :property | property name = field ]
				ifFound: [ :property | currentFMProperty := property ].

			"Nodes can be a simple node or a collection of nodes."
			nodes isCollection ifTrue: [ nodes do: [ :node | node accept: self ] ] ifFalse: [ nodes accept: self ].
				
			currentFMProperty := nil ].
		
	context pop
]

{ #category : 'visiting' }
TSFASTImporter >> visitNode: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntityFrom: aTSNode.
	
	"If the context is not empty, I'll set the newly built fast entity to the top of the context."
	context ifNotEmpty: [
			"I have two way to set myself in my parent:
				- EIther my parent have a children property of the same name as the field the node belongs to and we set it there. This is the case if the current property is not nil
				- Else I add the entity to the generic children."
			currentFMProperty
				ifNil: [ context top addGenericChildren: fastEntity ]
				ifNotNil: [ :property |
						property isMultivalued
							ifTrue: [ context top perform: ('add' , property implementingSelector asSingular capitalized , ':') asSymbol with: fastEntity ]
							ifFalse: [ context top perform: property implementingSelector asMutator with: fastEntity ] ] ].

	aTSNode hasChildren ifTrue: [ self visitChildren: aTSNode in: fastEntity ].

	^ fastEntity
]
