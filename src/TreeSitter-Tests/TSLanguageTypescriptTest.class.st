Class {
	#name : 'TSLanguageTypescriptTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageTypescriptTest >> setUp [

	super setUp.

	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript .
	parser language: typescriptLanguage.
]

{ #category : 'running' }
TSLanguageTypescriptTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageTypescriptTest >> testCollectAllSymbolOfOneSymbolType [

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 191
]

{ #category : 'tests' }
TSLanguageTypescriptTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]

{ #category : 'tests' }
TSLanguageTypescriptTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltyperegular
]

{ #category : 'tests' }
TSLanguageTypescriptTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount equals: 383
]
