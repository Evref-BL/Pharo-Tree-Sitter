"
I am an abstract importer for FAST based on TreeSitter.

Projects implementing a FAST importer with TreeSitter should inherit from me.

In order to work I need two things:
- To define the `tsLanguage` to use with TreeSitter.
- To have a visitor to do the actual import once we parsed the code.

By default the visitor will be a `TSFASTVisitor` that is fully automatic. But if your goal is to have a ""clean"" FAST model, you will need to create a subclass of `TSFASTCustomizableVisitor`. 

For more information check the documentation of the project in the github repository.

In the future I should be able to manage incremental imports.
"
Class {
	#name : 'TSFASTAbstractImporter',
	#superclass : 'Object',
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

{ #category : 'parsing' }
TSFASTAbstractImporter class >> parse: aString [

	^ self new parse: aString
]

{ #category : 'parsing' }
TSFASTAbstractImporter class >> parseFile: aFileReference [
	"We could optimize by using the binary read stream of the file, but that means we would have to manage the encoding and the importer is not managing that yet.
	
	This implementation only accept utf8 for now. Next step would be to detect the encoding of the file before reading the contents."

	^ self parse: aFileReference asFileReference contents
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
TSFASTAbstractImporter >> parse: aString [

	| tsTree fastTree |
	self initialiseTreeSitterParser.

	tsTree := self tsParser parseString: aString.
	
	fastTree := self visitorClass new
		            originString: aString;
		            in: [ :importer | errorReportBlock ifNotNil: [ importer errorReportBlock: errorReportBlock ] ];
		            import: tsTree rootNode.

	self deleteTreeSitterParser.

	^ fastTree
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
