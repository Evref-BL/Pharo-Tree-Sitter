"
A TSParserTest is a test class for testing the behavior of TSParser
"
Class {
	#name : 'TSParserTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserTest >> setUp [

	super setUp.

	parser := TSParser new
]

{ #category : 'running' }
TSParserTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserTest >> testLanguageVersion [

	self
		should: [ parser language version ]
		raise: TSNullPointerException
]

{ #category : 'tests' }
TSParserTest >> testRootNodeSymbolSimplePythonProgram [

	| pythonLanguage string tree |
	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage.

	string := 'print("Hello, I''m Python!")'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	"108 is a magic number for now"
	self assert: tree rootNode symbol equals: 108
]

{ #category : 'tests' }
TSParserTest >> testRootOfSimplePythonHasOneChild [

	| pythonLanguage string tree |
	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage.

	string := 'print("Hello, I''m Python!")'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'tests' }
TSParserTest >> testRootOfSimplePythonHasOneNamedChild [

	| pythonLanguage string tree |
	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage.

	string := 'print("Hello, I''m Python!")'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self assert: tree rootNode namedChildCount equals: 1
]
