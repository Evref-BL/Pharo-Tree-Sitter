Class {
	#name : 'TSParserCTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'cLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserCTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.

	parser := TSParser new.
	cLanguage := TSLanguage cLang.
	parser language: cLanguage
]

{ #category : 'running' }
TSParserCTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserCTest >> testPositionEndPointInString [

	| string tree |
	string := 'printf("Hello, I''m C!"); //comment'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second endPoint)
		equals: 34
]

{ #category : 'running' }
TSParserCTest >> testPositionInString [

	| string tree |
	string := 'printf("Hello, I''m C!"); //comment'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second startPoint)
		equals: 25
]

{ #category : 'running' }
TSParserCTest >> testRootOfSimpleCHasOneChild [

	| string tree |
	string := 'printf("Hello, I''m C!");'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'running' }
TSParserCTest >> testRootOfSimplePythonHasOneNamedChild [

	| string tree |
	string := 'printf("Hello, I''m C!");'.

	tree := TSLibrary uniqueInstance
		        ts_parser: parser
		        _parse_string: string
		        ofLength: string size
		        usingOldTree: ExternalAddress null.
	self assert: tree rootNode namedChildCount equals: 1
]
