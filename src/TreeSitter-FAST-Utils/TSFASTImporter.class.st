"
I am a generic importer for a FAST model.

I will create all the nodes and relations of the FAST model taking a root node as parameter. 

I will do an exact match to the Tree Sitter AST but I have a subclass that can allow to tweak the model to generate.

Implementation details:
- The context contains the stack of all elements ""parent"" to the node that is currently been visited. 
- The #currentFMProperty can either be nil or a FMProperty. If it is a property, it means that the nodes been visited are part of a field of their parent that has the same name as a contained entities property of the fast entity. Thus we save it to save the children in this property instead of the generic one.
- #containedEntitiesPropertiesMap will save for each kind of FAST class the possible children properties for perf reasons.
"
Class {
	#name : 'TSFASTImporter',
	#superclass : 'TSVisitor',
	#instVars : [
		'classesPrefix',
		'model',
		'originString',
		'containedEntitiesPropertiesMap',
		'context',
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
TSFASTImporter >> containedEntitiesPropertiesFor: aClass [
	"I am a cache to know for a FAST class the list of Fame properties they have to define a contained entity."

	^ containedEntitiesPropertiesMap at: aClass ifAbsentPut: [ aClass mooseDescription allProperties select: #isChildrenProperty ]
]

{ #category : 'visiting' }
TSFASTImporter >> createEntityForNode: aTSNode [

	^ self createEntityForNode: aTSNode kind: (self class environment at: (self classesPrefix , aTSNode type pascalized) asSymbol)
]

{ #category : 'visiting' }
TSFASTImporter >> createEntityForNode: aTSNode kind: aFASTClass [

	^ self createEntityForNode: aTSNode kind: aFASTClass parentManagementBlock: [ :entity :parent :currentParentProperty |
			"By default, I have two way to set myself in my parent:
				- Either my parent have a children property of the same name as the field the node belongs to and we set it there. This is the case if the current property is not nil
				- Else I add the entity to the generic children."
			currentParentProperty
				ifNil: [ parent addGenericChildren: entity ]
				ifNotNil: [ :property |
						property isMultivalued
							ifTrue: [ parent perform: ('add' , property implementingSelector asSingular capitalized , ':') asSymbol with: entity ]
							ifFalse: [ parent perform: property implementingSelector asMutator with: entity ] ] ]
]

{ #category : 'visiting' }
TSFASTImporter >> createEntityForNode: aTSNode kind: aFASTClass parentManagementBlock: aBlock [

	| fastEntity |
	fastEntity := self instantiateFastEntity: aFASTClass from: aTSNode.
	
	"If the context is not empty, I'll set the newly built fast entity to the top of the context.
	If it is empty this is the root node and we set its source."
	context
		ifEmpty: [ fastEntity source: self originString. ]
		ifNotEmpty: [ aBlock cull: fastEntity cull: context top cull: currentFMProperty  ].

	aTSNode hasChildren ifTrue: [ self visitChildren: aTSNode in: fastEntity ].

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTImporter >> createEntityForNode: aTSNode parentManagementBlock: aBlock [

	^ self createEntityForNode: aTSNode kind: (self class environment at: (self classesPrefix , aTSNode type pascalized) asSymbol) parentManagementBlock: aBlock
]

{ #category : 'actions' }
TSFASTImporter >> import: aTSNode [

	model := self newInstanceOfClassNamed: self classesPrefix , 'Model'.
	aTSNode accept: self.
	^ model
]

{ #category : 'initialization' }
TSFASTImporter >> initialize [

	super initialize.
	containedEntitiesPropertiesMap := IdentityDictionary new.
	context := Stack new
]

{ #category : 'actions' }
TSFASTImporter >> instantiateFastEntity: aFASTClass from: aTSNode [
	"We instantiate the right class, add it to the model and set the sources positions."

	| fastEntity |
	fastEntity := aFASTClass new.

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
TSFASTImporter >> tsLanguage: anObject [

	self deprecated: 'This is not used and can be removed.' t
]

{ #category : 'visiting' }
TSFASTImporter >> visitChildren: aTSNode in: fastEntity [
	"Now we will visit the children after adding myself as the top context so that they can find their parent."

	| previousProperty |
	context push: fastEntity.
	
	"When visiting the children of the children we might lose the current property so we save it."
	previousProperty := currentFMProperty.
	
	aTSNode collectFieldNameOfNamedChild keysAndValuesDo: [ :field :nodes |
			"If the field has the name of a property, we save this property so that my children can use it to set themselves in the right variable"
			(self containedEntitiesPropertiesFor: fastEntity class)
				detect: [ :property | property name = field ]
				ifFound: [ :property | currentFMProperty := property ].

			"Nodes can be a simple node or a collection of nodes."
			nodes isCollection ifTrue: [ nodes do: [ :node | node accept: self ] ] ifFalse: [ nodes accept: self ].
				
			currentFMProperty := nil ].

	currentFMProperty := previousProperty.
	context pop
]

{ #category : 'visiting' }
TSFASTImporter >> visitNode: aTSNode [

	^ self createEntityForNode: aTSNode
]
