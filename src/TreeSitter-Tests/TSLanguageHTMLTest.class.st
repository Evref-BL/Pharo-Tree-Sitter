Class {
	#name : 'TSLanguageHTMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'htmlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageHTMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	htmlLanguage := TSLanguage html.
	parser language: htmlLanguage
]

{ #category : 'running' }
TSLanguageHTMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageHTMLTest >> testCollectAllSymbolOfOneSymbolType [

	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.
	
	self assert: symbols isNotEmpty .
	self assert: symbols size > 25
]

{ #category : 'tests' }
TSLanguageHTMLTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '<!'
]

{ #category : 'tests' }
TSLanguageHTMLTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltypeanonymous 
]

{ #category : 'tests' }
TSLanguageHTMLTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount > 40
]
