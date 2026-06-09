Class {
	#name : 'TSLanguageTypescriptTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Typescript-Tests',
	#package : 'TreeSitter-Typescript-Tests'
}

{ #category : 'running' }
TSLanguageTypescriptTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript.
	parser language: typescriptLanguage
]

{ #category : 'running' }
TSLanguageTypescriptTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageTypescriptTest >> testCollectAllSymbolOfOneSymbolType [

	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 190
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

	self assert: parser language symbolCount > 380
]
