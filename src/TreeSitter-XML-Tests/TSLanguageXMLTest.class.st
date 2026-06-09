Class {
	#name : 'TSLanguageXMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'xmlLanguage'
	],
	#category : 'TreeSitter-XML-Tests',
	#package : 'TreeSitter-XML-Tests'
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

	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 50
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

	self assert: parser language symbolCount > 140
]
