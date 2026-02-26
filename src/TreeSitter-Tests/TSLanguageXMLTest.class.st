Class {
	#name : 'TSLanguageXMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'xmlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageXMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	xmlLanguage := TSLanguage xml.
	parser language: xmlLanguage
]

{ #category : 'running' }
TSLanguageXMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageXMLTest >> testCollectAllSymbolOfOneSymbolType [

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 53
]

{ #category : 'tests' }
TSLanguageXMLTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'Name'
]

{ #category : 'tests' }
TSLanguageXMLTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltyperegular
]

{ #category : 'tests' }
TSLanguageXMLTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount equals: 143
]
