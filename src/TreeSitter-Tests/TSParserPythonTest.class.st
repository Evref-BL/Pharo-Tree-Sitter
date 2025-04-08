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

	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage.
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

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
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

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second startPoint)
		equals: 28
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testRootNodeSymbolSimplePythonProgram [

	| string tree |

	string := 'print("Hello, I''m Python!")'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	"108 is a magic number for now"
	self assert: tree rootNode symbol equals: 108
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testRootOfSimplePythonHasOneChild [

	| string tree |
	string := 'print("Hello, I''m Python!")'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'as yet unclassified' }
TSParserPythonTest >> testRootOfSimplePythonHasOneNamedChild [

	| string tree |
	string := 'print("Hello, I''m Python!")'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self assert: tree rootNode namedChildCount equals: 1
]
