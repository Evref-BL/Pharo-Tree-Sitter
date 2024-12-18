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
