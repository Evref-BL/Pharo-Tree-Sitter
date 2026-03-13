Class {
	#name : 'TSParserCSSTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'cssLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserCSSTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	cssLanguage := TSLanguage css.
	parser language: cssLanguage
]

{ #category : 'running' }
TSParserCSSTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserCSSTest >> testPositionEndPointInString [

	| string tree |
	
	string := '.myClass {
      color: blue;
      margin-left: 40px;
   }' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 59
]

{ #category : 'tests' }
TSParserCSSTest >> testPositionInString [

	| string tree |
	
	string := '.myClass {
      color: blue;
      margin-left: 40px;
   }' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first namedChildren second startPoint)
		equals: 9
]

{ #category : 'tests' }
TSParserCSSTest >> testRootNodeSymbolSimpleCSSClass [

	| string tree |
	
	string := '.myClass {
      color: blue;
      margin-left: 40px;
   }' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode symbol equals: 75
]

{ #category : 'tests' }
TSParserCSSTest >> testRootOfSimpleCSSClasstHasOneChild [

	| string tree |
	
	string := '.myClass {
      color: blue;
      margin-left: 40px;
   }' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'tests' }
TSParserCSSTest >> testRootOfSimpleCSSClasstHasOneNamedChild [

	| string tree |
	
	string := '.myClass {
      color: blue;
      margin-left: 40px;
   }' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1
]
