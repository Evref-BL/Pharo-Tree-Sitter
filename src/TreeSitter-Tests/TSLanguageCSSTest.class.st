Class {
	#name : 'TSLanguageCSSTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'cssLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageCSSTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	cssLanguage := TSLanguage css.
	parser language: cssLanguage
]

{ #category : 'running' }
TSLanguageCSSTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageCSSTest >> testCollectAllSymbolOfOneSymbolType [

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 82
]

{ #category : 'tests' }
TSLanguageCSSTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '@import'
]

{ #category : 'tests' }
TSLanguageCSSTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltypeanonymous 
]

{ #category : 'tests' }
TSLanguageCSSTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount equals: 151
]
