Class {
	#name : 'TSParserPythonTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'pythonLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserPythonTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage
]

{ #category : 'running' }
TSParserPythonTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserPythonTest >> testPositionEndPointInString [

	| string tree |
	string := 'print("Hello, I''m Python!")
# comment'.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second endPoint)
		equals: 37
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testPositionInString [

	| string tree |
	string := 'print("Hello, I''m Python!")
# comment'.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second startPoint)
		equals: 28
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testRootNodeSymbolSimplePythonProgram [

	| string tree |
	string := 'print("Hello, I''m Python!")'.

	tree := parser parseString: string.
	"108 is a magic number for now"
	self assert: tree rootNode symbol equals: 108
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testRootOfSimplePythonHasOneChild [

	| string tree |
	string := 'print("Hello, I''m Python!")'.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testRootOfSimplePythonHasOneNamedChild [

	| string tree |
	string := 'print("Hello, I''m Python!")'.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1
]
