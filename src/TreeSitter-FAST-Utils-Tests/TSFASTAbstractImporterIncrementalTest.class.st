"
I test the incremental parsing of TSFASTAbstractImporter with TSFASTTestImporter: a new version of a model source is reparsed from the tree of the previous version.
"
Class {
	#name : 'TSFASTAbstractImporterIncrementalTest',
	#superclass : 'TestCase',
	#category : 'TreeSitter-FAST-Utils-Tests',
	#package : 'TreeSitter-FAST-Utils-Tests'
}

{ #category : 'tests' }
TSFASTAbstractImporterIncrementalTest >> testReparseAnswersTheModelOfTheNewSource [

	| importer first second |
	importer := TSFASTTestImporter new.
	first := importer parse: 'a'.
	second := importer parse: 'ab' usingOldTree: first.
	self assert: second equals: { 'ab'. 2 }
]

{ #category : 'tests' }
TSFASTAbstractImporterIncrementalTest >> testReparseFailsForAModelTheImporterDidNotAnswer [

	self should: [ TSFASTTestImporter new parse: 'ab' usingOldTree: Object new ] raise: Error
]

{ #category : 'tests' }
TSFASTAbstractImporterIncrementalTest >> testReparseForgetsTheModelItReplaced [

	| importer first second |
	importer := TSFASTTestImporter new.
	first := importer parse: 'a'.
	second := importer parse: 'ab' usingOldTree: first.
	self should: [ importer parse: 'abc' usingOldTree: first ] raise: Error.
	self assert: (importer parse: 'abc' usingOldTree: second) equals: { 'abc'. 3 }
]
