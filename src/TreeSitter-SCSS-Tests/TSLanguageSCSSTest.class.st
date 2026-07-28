Class {
	#name : 'TSLanguageSCSSTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'language'
	],
	#category : 'TreeSitter-SCSS-Tests',
	#package : 'TreeSitter-SCSS-Tests'
}

{ #category : 'running' }
TSLanguageSCSSTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	language := TSLanguage scss.
	parser language: language
]

{ #category : 'running' }
TSLanguageSCSSTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageSCSSTest >> testCollectAllSymbolOfOneSymbolType [

	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 85
]

{ #category : 'tests' }
TSLanguageSCSSTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '@import'
]

{ #category : 'tests' }
TSLanguageSCSSTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltypeanonymous 
]

{ #category : 'tests' }
TSLanguageSCSSTest >> testSCSSNumberOfSymbol [

	self assert: parser language symbolCount > 180
]
