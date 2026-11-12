"
I am a minimal importer used to test the incremental parsing of TSFASTAbstractImporter. I answer the source and the end byte of the tree-sitter root node instead of a FAST model.
"
Class {
	#name : 'TSFASTTestImporter',
	#superclass : 'TSFASTAbstractImporter',
	#category : 'TreeSitter-FAST-Utils-Tests',
	#package : 'TreeSitter-FAST-Utils-Tests'
}

{ #category : 'parsing' }
TSFASTTestImporter >> importToFAST: aTSRootNode usingSourceCode: aString [

	^ {
		  aString.
		  aTSRootNode endByte }
]

{ #category : 'accessing' }
TSFASTTestImporter >> tsLanguage [

	^ TSLanguage typescript
]
