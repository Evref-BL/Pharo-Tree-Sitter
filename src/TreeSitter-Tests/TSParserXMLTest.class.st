Class {
	#name : 'TSParserXMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'xmlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserXMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	xmlLanguage := TSLanguage xml.
	parser language: xmlLanguage
]

{ #category : 'running' }
TSParserXMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserXMLTest >> testPositionEndPointInString [

	| string tree |
	string := '<Message> Hello World ! </Message>' withPlatformLineEndings.
	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 34
]

{ #category : 'tests' }
TSParserXMLTest >> testPositionInString [

	| string tree |
	
	string := '<Message> Hello World ! </Message>' withPlatformLineEndings.
	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first namedChildren second startPoint)
		equals: 9
]

{ #category : 'tests' }
TSParserXMLTest >> testRootNodeSymbolSimpleXMLDocument [

	| string tree |
	string := '<Message> Hello World ! </Message>'.

	tree := parser parseString: string. 
	self assert: tree rootNode symbol equals: 74
]

{ #category : 'tests' }
TSParserXMLTest >> testRootOfSimpleXMLDocumentHasOneChild [

	| string tree |
	string := '<Message> Hello World ! </Message>'.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1 
]

{ #category : 'tests' }
TSParserXMLTest >> testRootOfSimpleXMLDocumentHasOneNamedChild [

	| string tree |
	string := '<Message> Hello World ! </Message>'.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1 
]
