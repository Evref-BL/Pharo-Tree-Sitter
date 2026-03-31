"
## Description 

I am a generic visitor to import a FAST model from a TreeSitter tree.
 
I will create all the nodes and relations of the FAST model taking a root node as parameter. 

I will do an exact match to the Tree Sitter AST but I have a subclass that can allow to tweak the model to generate.

## Implementation details

When checking my code you might think that I have a lot of methods for what I do. The reason is that I am letting a lot of hooks in order for the `TSFASTCustomizableVisitor` to be effective. 
Please, do not simplify the API, we need all those parameters.

### Context

In order to make it easier to implement the importer and also to make it easier to customize the import in my subclasses, I am saving a ""context"" of the import. 

The context is a stack of `TSFASTContextEntry`. We will create one for each parent/children level in the tree we are currently visiting. An entry knows the TSNode been visited, the fast entity created from it, the field in which the TSNode was in its parent and the fm property that is optionaly associated to this entity based on its name. 

The fmProperty can either be nil or a FMProperty. If it is a property, it means that the nodes been visited are part of a field of their parent that has the same name as a contained entities property of the fast entity. Thus we save it to save the children in this property instead of the generic one.

 #containedEntitiesPropertiesMap will save for each kind of FAST class the possible children properties for perf reasons

The context can do more but this will be detailed in `TSFASTContextEntry` and `TSFASTCustomizableVisitor` class comments.

### Source positions management

TreeSitter is providing the positions of the nodes in the parsed string in number of bytes but the current implementation of FAST requires the positions in number of characters. 
In the origin implementation we were computing for each nodes the number of characters from the start and end positions in number of bytes.

Now we are taking a different direction. We know that we provide the source code to tree sitter encoded un UTF8.
With this information we build a map cached in #bytesToCharactersMap that will associate to the index of each leading bytes, the index of the corresponding character. 

This allows to build once the index map and to just use it to convert bytes positions into characters positions which is speeding up a lot the import.

### Error reporting

Since it is common to have errors during the import of a project (importers are hard to build since so many things can happen), we catch the errors happening during the visit of the nodes and we proceed with the visit. 

At the end of the import, the errors are inspected by default.
This behavior can be changed by overriding the method or setting #errorReportBlock: to do something else.

During development you can toggle a debug mode in the Pharo ""Debug"" menu.
"
Class {
	#name : 'TSFASTVisitor',
	#superclass : 'TSVisitor',
	#instVars : [
		'classesPrefix',
		'model',
		'originString',
		'containedEntitiesPropertiesMap',
		'context',
		'bytesToCharactersMap',
		'errors',
		'addSelectors',
		'errorReportBlock'
	],
	#classVars : [
		'IsInDebugMode'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'class initialization' }
TSFASTVisitor class >> initialize [
	self deprecatedAliases: { #TSFASTImporter }
]

{ #category : 'testing' }
TSFASTVisitor class >> isInDebugMode [

	^ IsInDebugMode ifNil: [ IsInDebugMode := false ]
]

{ #category : 'testing' }
TSFASTVisitor class >> isInDebugMode: aBoolean [

	IsInDebugMode := aBoolean
]

{ #category : 'world menu' }
TSFASTVisitor class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'Toggle FAST Importer Debug mode')
		parent: #Debug;
		action: [ self isInDebugMode: self isInDebugMode not ];
		order: 99999;
		withSeparatorAfter;
		help: 'If this is enabled, errors will not be caught in the FAST importing but passed.';
		icon: (self iconNamed: #configuration)
]

{ #category : 'visiting' }
TSFASTVisitor >> addSelectorFor: aSelector [

	^ addSelectors at: aSelector ifAbsentPut: [ ('add' , aSelector asSingular capitalized , ':') asSymbol ]
]

{ #category : 'private' }
TSFASTVisitor >> bytesToCharacterMap [
	"We consider that the string is UTF8 encoded in the FAST importer. If we parse a file in UTF16 or another encoding, we should decode it and encode it in UTF8.
	
	In Famix we cannot do that since the source code is in files. But in FAST we keep the source code in a Pharo string allowing to do this."

	^ bytesToCharactersMap ifNil: [ bytesToCharactersMap := ZnUTF8Encoder default mapBytesToCharactersFor: self originString ]
]

{ #category : 'private' }
TSFASTVisitor >> characterPositionAtByte: aNumber [

	^ self bytesToCharacterMap at: aNumber ifAbsent: [ SubscriptOutOfBounds signalFor: aNumber ]
]

{ #category : 'accessing' }
TSFASTVisitor >> classesPrefix [

	^ classesPrefix
]

{ #category : 'private' }
TSFASTVisitor >> containedEntitiesPropertiesFor: aClass [
	"I am a cache to know for a FAST class the list of Fame properties they have to define a contained entity."

	^ containedEntitiesPropertiesMap at: aClass ifAbsentPut: [ aClass mooseDescription allProperties select: #isChildrenProperty ]
]

{ #category : 'utilities' }
TSFASTVisitor >> customizeNewContext: aContextEntry [
	"Hook"

	
]

{ #category : 'initialization' }
TSFASTVisitor >> errorReportBlock: aBlock [

	errorReportBlock := aBlock
]

{ #category : 'accessing' }
TSFASTVisitor >> errors [

	^ errors
]

{ #category : 'private' }
TSFASTVisitor >> handleErrorsDuring: aBlock [
	"During the visit of the nodes, if an error happens and the debug mode is not enabled, we save the errors in an error report and we keep going with the parsing of the following nodes."

	^ aBlock onErrorDo: [ :error |
			  self class isInDebugMode
				  ifTrue: [ error pass ]
				  ifFalse: [
						  errors add: error.
						  nil ] ]
]

{ #category : 'visiting' }
TSFASTVisitor >> handleNode: aTSNode [

	^ self handleNode: aTSNode kind: (self kindForType: aTSNode type)
]

{ #category : 'visiting' }
TSFASTVisitor >> handleNode: aTSNode kind: aFASTClass [

	^ self handleNode: aTSNode kind: aFASTClass parentBlock: [ :entity | self setParentOf: entity ]
]

{ #category : 'visiting' }
TSFASTVisitor >> handleNode: aTSNode kind: aFASTClass parentBlock: aBlock [

	| fastEntity |
	fastEntity := self instantiateFastEntity: aFASTClass from: aTSNode.
	
	"If the context is not empty, I'll use it to set the entity in its parent via the parent management block.
	If it is empty this is the root node and we set its source."
	context
		ifNotEmpty: [ aBlock cull: fastEntity cull: context top "providing the top context optionaly in case there is some intricated nested cases." ]
		ifEmpty: [ fastEntity source: self originString ].

	aTSNode hasChildren ifTrue: [ self pushContext: fastEntity node: aTSNode during: [ self visitChildren: aTSNode ] ].

	^ fastEntity
]

{ #category : 'visiting' }
TSFASTVisitor >> handleNode: aTSNode parentBlock: aBlock [

	^ self handleNode: aTSNode kind: (self class environment at: (self classesPrefix , aTSNode type pascalized) asSymbol) parentBlock: aBlock
]

{ #category : 'actions' }
TSFASTVisitor >> import: aTSNode [
	"Consider we will not add duplicated entities with the algo of the importer."

	FMShouldCheckForDuplicatedEntitiesInMultivalueLinks value: false during: [
			model := self newInstanceOfClassNamed: self classesPrefix , 'Model'.
			aTSNode accept: self.
			self manageErrorReport ].

	^ model
]

{ #category : 'initialization' }
TSFASTVisitor >> initialize [

	super initialize.
	containedEntitiesPropertiesMap := IdentityDictionary new.
	context := Stack new.
	errors := OrderedCollection new.
	addSelectors := IdentityDictionary new.
	errorReportBlock := [ :importer | importer errors ifNotEmpty: [ importer errors inspect ] ]
]

{ #category : 'actions' }
TSFASTVisitor >> instantiateFastEntity: aFASTClass from: aTSNode [
	"We instantiate the right class, add it to the model and set the sources positions."

	| fastEntity |
	fastEntity := aFASTClass newTenured.

	model add: fastEntity.

	fastEntity startPos: (self characterPositionAtByte: aTSNode startByte) + 1.
	fastEntity endPos: (self characterPositionAtByte: aTSNode endByte).

	^ fastEntity
]

{ #category : 'accessing' }
TSFASTVisitor >> kindForType: aSymbol [

	^ self class environment at: (self classesPrefix , aSymbol pascalized) asSymbol
]

{ #category : 'accessing' }
TSFASTVisitor >> languageName: aString [

	classesPrefix := 'FAST' , aString
]

{ #category : 'actions' }
TSFASTVisitor >> manageErrorReport [
	"By default if errors happens I inspect the list. If you want other behaviors you can override me in order to do what you want for the error reporting or set the #errorReportBlock."

	^ errorReportBlock cull: self
]

{ #category : 'utilities' }
TSFASTVisitor >> newInstanceOfClassNamed: aString [

	^ (aString asClassInEnvironment: self class environment) newTenured
]

{ #category : 'accessing' }
TSFASTVisitor >> originString [

	^ originString
]

{ #category : 'accessing' }
TSFASTVisitor >> originString: aString [

	originString := aString
]

{ #category : 'visiting' }
TSFASTVisitor >> pushContext: fastEntity node: aTSNode during: aBlock [

	[
		context push: (TSFASTContextEntry fastEntity: fastEntity tsNode: aTSNode).
		self customizeNewContext: context top.
		aBlock value ] ensure: [ context pop ]
]

{ #category : 'visiting' }
TSFASTVisitor >> setParentOf: entity [
	"By default, I have two way to set myself in my parent:
		- Either my parent have a children property of the same name as the field the node belongs to and we set it there. This is the case if the current property is not nil
		- Else I add the entity to the generic children."

	context top fmProperty
		ifNil: [ self topFastEntity addGenericChild: entity ]
		ifNotNil: [ :property |
				property isMultivalued
					ifTrue: [ self topFastEntity perform: (self addSelectorFor: property implementingSelector) with: entity ]
					ifFalse: [ self topFastEntity perform: property implementingSelector asMutator with: entity ] ]
]

{ #category : 'utilities' }
TSFASTVisitor >> setTopFieldTo: field [

	context top field: field.
	
	"If the field has the name of a property, we save this property so that my children can use it to set themselves in the right variable"
	^ (self containedEntitiesPropertiesFor: self topFastEntity class)
		  detect: [ :property | context top fieldMatchesProperty: property ]
		  ifFound: [ :property | context top fmProperty: property ]
]

{ #category : 'accessing' }
TSFASTVisitor >> topFastEntity [
	"helper"

	^ context top fastEntity
]

{ #category : 'accessing' }
TSFASTVisitor >> tsLanguage: anObject [

	self deprecated: 'This is not used and can be removed.'
]

{ #category : 'visiting' }
TSFASTVisitor >> visitChildren: aTSNode [
	"Now we will visit the children after adding myself as the top context so that they can find their parent."

	aTSNode collectFieldNameOfNamedChild keysAndValuesDo: [ :field :nodes |
			self setTopFieldTo: field.
			nodes asTSNodes do: [ :node | node accept: self ] ]
]

{ #category : 'visiting' }
TSFASTVisitor >> visitNode: aTSNode [

	^ self handleErrorsDuring: [ self handleNode: aTSNode ]
]
