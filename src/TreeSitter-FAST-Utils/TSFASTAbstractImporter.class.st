"
I am an abstract importer for FAST based on TreeSitter.

Projects implementing a FAST importer with TreeSitter should inherit from me.

In order to work I need two things:
- To define the `tsLanguage` to use with TreeSitter.
- To have a visitor to do the actual import once we parsed the code.

By default the visitor will be a `TSFASTVisitor` that is fully automatic. But if your goal is to have a ""clean"" FAST model, you will need to create a subclass of `TSFASTCustomizableVisitor`. 

For more information check the documentation of the project in the github repository.

In the future I should be able to manage incremental imports.

I use FASTTImporter so the importers created by subclassing me can be used via the `FASTAgnosticImporter` of FAST.
"
Class {
	#name : 'TSFASTAbstractImporter',
	#superclass : 'Object',
	#traits : 'FASTTImporter',
	#classTraits : 'FASTTImporter classTrait',
	#instVars : [
		'errorReportBlock',
		'tsParser'
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

{ #category : 'initialization' }
TSFASTAbstractImporter >> initialiseTreeSitterParser [

	self tsParser: (TSParser new
			 language: self tsLanguage;
			 yourself)
]

{ #category : 'parsing' }
TSFASTAbstractImporter >> parse: aString into: aModel [
	"Import the source in the FAST model, or in a new one if the model is nil, and answer the model"

	| tsTree fastModel |
	self initialiseTreeSitterParser.
	
	tsTree := self tsParser parseString: aString.
	
	fastModel := self visitorClass new
		             originString: aString;
		             in: [ :importer | errorReportBlock ifNotNil: [ importer errorReportBlock: errorReportBlock ] ];
		             import: tsTree rootNode into: aModel.
		
	self deleteTreeSitterParser.
	^ fastModel
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
