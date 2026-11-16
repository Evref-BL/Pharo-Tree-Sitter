"
I am an abstract importer for FAST based on TreeSitter.

Projects implementing a FAST importer with TreeSitter should inherit from me.

In order to work I need two things:
- To define the `tsLanguage` to use with TreeSitter.
- To have a visitor to do the actual import once we parsed the code.

By default the visitor will be a `TSFASTVisitor` that is fully automatic. But if your goal is to have a ""clean"" FAST model, you will need to create a subclass of `TSFASTCustomizableVisitor`. Importers doing a customized conversion override #importToFAST:usingSourceCode:.

I import incrementally: after #parse:, the source of the model can be changed and reparsed with #parse:usingOldTree:, which reuses the tree-sitter tree of the previous version. I remember one TSFASTTreeRepresentation per model I answered.

For more information check the documentation of the project in the github repository.

I use FASTTImporter so the importers created by subclassing me can be used via the `FASTAgnosticImporter` of FAST.
"
Class {
	#name : 'TSFASTAbstractImporter',
	#superclass : 'Object',
	#traits : 'FASTTImporter',
	#classTraits : 'FASTTImporter classTrait',
	#instVars : [
		'errorReportBlock',
		'tsParser',
		'representations'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'testing' }
TSFASTAbstractImporter class >> isAbstract [

	^ self = TSFASTAbstractImporter
]

{ #category : 'initialization' }
TSFASTAbstractImporter >> deleteTreeSitterParser [

	self tsParser delete
]

{ #category : 'accessing' }
TSFASTAbstractImporter >> errorReportBlock: aBlock [

	errorReportBlock := aBlock
]

{ #category : 'parsing' }
TSFASTAbstractImporter >> importToFAST: aTSRootNode usingSourceCode: aString [
	"Convert the tree-sitter tree into a FAST model. Importers that need a customized conversion override me."

	^ self visitorClass new
		  originString: aString;
		  in: [ :importer | errorReportBlock ifNotNil: [ importer errorReportBlock: errorReportBlock ] ];
		  import: aTSRootNode
]

{ #category : 'initialization' }
TSFASTAbstractImporter >> initialiseTreeSitterParser [

	self tsParser: (TSParser new
			 language: self tsLanguage;
			 yourself)
]

{ #category : 'parsing' }
TSFASTAbstractImporter >> parse: aString [
	"Import the source in a new FAST model, remember the tree-sitter tree of the source so that a later version of it can be parsed incrementally, and answer the model"

	| tsTree fastModel |
	self initialiseTreeSitterParser.
	tsTree := self tsParser parseString: aString.
	fastModel := self importToFAST: tsTree rootNode usingSourceCode: aString.
	self deleteTreeSitterParser.
	self rememberTree: tsTree source: aString forModel: fastModel.
	^ fastModel
]

{ #category : 'parsing' }
TSFASTAbstractImporter >> parse: aString into: aModel [
	"Import the source in the FAST model given, or in a new one when it is nil, and answer the model. The entities of the source are moved into the model given, so that several sources can be imported in one model. A model given here is not remembered for incremental parsing."

	| tsTree fastModel |
	aModel ifNil: [ ^ self parse: aString ].

	self initialiseTreeSitterParser.
	tsTree := self tsParser parseString: aString.
	fastModel := self importToFAST: tsTree rootNode usingSourceCode: aString.
	self deleteTreeSitterParser.
	fastModel entities copy do: [ :entity | aModel add: entity ].
	^ aModel
]

{ #category : 'parsing' }
TSFASTAbstractImporter >> parse: aString usingOldTree: anOldModel [
	"Import a new version of the source of a model answered by me, reusing the tree-sitter tree of the previous version: tree-sitter only reparses the changed part. I answer the new model and forget the old one, so only the model I answered last can be reparsed from its source."

	| representation tsTree fastModel |
	representation := self representationOf: anOldModel.
	self initialiseTreeSitterParser.
	self tsParser editTree: representation treeSitterTree usingInputEdit: (TSInputEdit fromString: representation source to: aString).
	tsTree := self tsParser parseString: aString usingTree: representation treeSitterTree.
	fastModel := self importToFAST: tsTree rootNode usingSourceCode: aString.
	self deleteTreeSitterParser.
	self representations remove: representation.
	self rememberTree: tsTree source: aString forModel: fastModel.
	^ fastModel
]

{ #category : 'private' }
TSFASTAbstractImporter >> rememberTree: aTSTree source: aString forModel: aFASTModel [
	"The incremental parsing of a model needs its source and its tree-sitter tree"

	self representations add: (TSFASTTreeRepresentation new
			 treeSitterTree: aTSTree;
			 source: aString;
			 fastModel: aFASTModel;
			 yourself)
]

{ #category : 'private' }
TSFASTAbstractImporter >> representationOf: aFASTModel [
	"Answer the tree-sitter tree remembered for the model, or fail if I did not answer this model"

	^ self representations
		  detect: [ :each | each fastModel == aFASTModel ]
		  ifNone: [ self error: 'No tree is remembered for this model. Parse the source first, or reparse the model answered by the last parse.' ]
]

{ #category : 'accessing' }
TSFASTAbstractImporter >> representations [
	"The trees remembered for the models I answered"

	^ representations ifNil: [ representations := OrderedCollection new ]
]

{ #category : 'accessing' }
TSFASTAbstractImporter >> tsLanguage [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
TSFASTAbstractImporter >> tsParser [
	^ tsParser
]

{ #category : 'accessing' }
TSFASTAbstractImporter >> tsParser: anObject [
	tsParser := anObject
]

{ #category : 'accessing' }
TSFASTAbstractImporter >> visitorClass [

	^ TSFASTVisitor
]
