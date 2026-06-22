Class {
	#name : 'TSParserJavaTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'javaLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserJavaTest >> setUp [

	super setUp.

	self timeLimit: 120 seconds.
	parser := TSParser new.
	javaLanguage := TSLanguage python.
	parser language: javaLanguage
]

{ #category : 'running' }
TSParserJavaTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserJavaTest >> testPositionEndPointInString [

	| string tree |
	string := 'System.out.println("Hello, I''m Java!");
// comment' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second endPoint)
		equals: 42
]

{ #category : 'tests' }
TSParserJavaTest >> testPositionInString [

	| string tree |
	string := 'System.out.println("Hello, I''m Java!");
// comment' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second startPoint)
		equals: 40
]

{ #category : 'tests' }
TSParserJavaTest >> testRootNodeSymbolSimpleJavaProgram [

	| string tree |
	string := 'System.out.println("Hello, I''m Java!");'.

	tree := parser parseString: string.
	self assert: tree rootNode symbol equals: 108
]

{ #category : 'tests' }
TSParserJavaTest >> testRootOfSimpleJavaHasTwoChilds [

	| string tree |
	string := 'System.out.println("Hello, I''m Java!");'.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 2
]

{ #category : 'tests' }
TSParserJavaTest >> testRootOfSimplePythonHasOneNamedChild [

	| string tree |
	string := 'System.out.println("Hello, I''m Java!");'.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1
]
