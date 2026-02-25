Class {
	#name : 'TSLanguageHMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'htmlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageHMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	htmlLanguage := TSLanguage html.
	parser language: htmlLanguage
]

{ #category : 'running' }
TSLanguageHMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageHMLTest >> testCollectAllSymbolOfOneSymbolType [

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 26
]

{ #category : 'tests' }
TSLanguageHMLTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '<!'
]

{ #category : 'tests' }
TSLanguageHMLTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltypeanonymous 
]

{ #category : 'tests' }
TSLanguageHMLTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount equals: 41
]
