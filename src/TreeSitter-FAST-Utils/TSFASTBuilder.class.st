"
I build a FAST metamodel generator based on a tree sitter language
"
Class {
	#name : 'TSFASTBuilder',
	#superclass : 'Object',
	#instVars : [
		'tsLanguage',
		'languageName'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'building' }
TSFASTBuilder >> addDefineClassIn: metamodelGeneratorClass [

	| method |
	method := String streamContents: [ :stream |
		          stream << 'defineClasses

'.
		          stream << '	entity := self newClassNamed: #Entity.

'.
		          self typesToReify
			          do: [ :type |
				          | variable |
				          variable := (self variableNameOfTSSymbol: type) pascalized.
				          variable ifNotEmpty: [
					          stream
						          << '	';
						          << variable;
						          << ' := '.
					          stream << 'builder ensureClassNamed: #'
					          << (tsLanguage nameOfSymbol: type ) pascalized capitalized << '.' ] ]
			          separatedBy: [
				          stream << '
' ] ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addDefineHierarchyIn: metamodelGeneratorClass [

	| method |
	method := String streamContents: [ :stream |
		          stream << 'defineHierarchy
	"define class hierarchy"

	super defineHierarchy.

	entity --|> tEntity.' ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addDefineRelationsIn: metamodelGeneratorClass [
	"should be improve if https://github.com/tree-sitter/tree-sitter/discussions/4017 got an answer"

	| method |
	method := String streamContents: [ :stream |
		          stream << 'defineRelations

	super defineRelations.
'.
		          stream
			          << String tab;
			          <<
				          '(entity property: #''genericChildren'') <>-* (entity property: #''genericParent'').'.
		           ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addDefineTraitsIn: metamodelGeneratorClass [

	| method |
	method := String streamContents: [ :stream |
		          stream << 'defineTraits

	super defineTraits.

	"From FAST"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.
' ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addPackageNameMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'packageName

	^ #''FAST-' , self languageName , '-Model'''
		classified: #accessing
]

{ #category : 'building' }
TSFASTBuilder >> addPrefixMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'prefix

	^ #FAST' , self languageName
		classified: #accessing
]

{ #category : 'building' }
TSFASTBuilder >> addSubmetamodelsMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'submetamodels

	^ { FASTMetamodelGenerator }'
		classified: #accessing
]

{ #category : 'api' }
TSFASTBuilder >> build [

	| metamodelGeneratorClass |
	metamodelGeneratorClass := self createMetamodelGeneratorClass.
	self addPrefixMethodIn: metamodelGeneratorClass.
	self addPackageNameMethodIn: metamodelGeneratorClass.
	self addSubmetamodelsMethodIn: metamodelGeneratorClass.
	self addDefineClassIn: metamodelGeneratorClass.
	self addDefineTraitsIn: metamodelGeneratorClass.
	self addDefineHierarchyIn: metamodelGeneratorClass.
	self addDefineRelationsIn: metamodelGeneratorClass.
	^ metamodelGeneratorClass
]

{ #category : 'building' }
TSFASTBuilder >> createMetamodelGeneratorClass [

	| classBuilder className types|
	className := #FAST , self languageName.
	classBuilder := FamixMetamodelGenerator
	                << (className , #MetamodelGenerator).
	types := ((self typesToReify 
			 collect: [ :type | (self variableNameOfTSSymbol: type) pascalized asSymbol ]
			 as: Set) asOrderedCollection ) reject: [ :each | each isEmpty ] .
	
	classBuilder slots: types, { #entity. #tEntity }.
	classBuilder package: #FAST , '-', self languageName , #'-Model-Generator'.
	^ classBuilder install
]

{ #category : 'building' }
TSFASTBuilder >> fieldToReify [

	^ 1 to: self tsLanguage fieldCount
]

{ #category : 'accessing' }
TSFASTBuilder >> languageName [

	^ languageName
]

{ #category : 'accessing' }
TSFASTBuilder >> languageName: anObject [

	languageName := anObject
]

{ #category : 'building' }
TSFASTBuilder >> nameOfField: aFieldIdx [

	^ tsLanguage nameOfField: aFieldIdx
]

{ #category : 'building' }
TSFASTBuilder >> parentNameOfField: aFieldIdx [

	^ (self nameOfField: aFieldIdx) , 'Parent'
]

{ #category : 'accessing' }
TSFASTBuilder >> tsLanguage [

	^ tsLanguage
]

{ #category : 'accessing' }
TSFASTBuilder >> tsLanguage: anObject [

	tsLanguage := anObject
]

{ #category : 'building' }
TSFASTBuilder >> typesToReify [

	^ tsLanguage symbolsOfType: TSSymbolType tssymboltyperegular
]

{ #category : 'building' }
TSFASTBuilder >> variableNameOfTSSymbol: aTSSymbol [
    
 	| variable |
    variable := tsLanguage nameOfSymbol: aTSSymbol.
    ^ variable isEmpty ifTrue: [''] ifFalse: [ '_', variable] 
 
]
