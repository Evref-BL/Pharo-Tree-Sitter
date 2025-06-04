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

	parser := TSParser new.
	cLanguage := TSLanguage python.
	parser language: cLanguage
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
		equals: 37
]
