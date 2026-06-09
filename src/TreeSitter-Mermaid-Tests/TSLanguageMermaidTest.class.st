Class {
	#name : 'TSLanguageMermaidTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'language'
	],
	#category : 'TreeSitter-Mermaid-Tests',
	#package : 'TreeSitter-Mermaid-Tests'
}

{ #category : 'running' }
TSLanguageMermaidTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	language := TSLanguage mermaid .
	parser language: language
]

{ #category : 'running' }
TSLanguageMermaidTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageMermaidTest >> testCollectAllSymbolOfOneSymbolType [

	| symbols |
	symbols := parser language symbolsOfType:
		           TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 195
]

{ #category : 'tests' }
TSLanguageMermaidTest >> testMermaidNumberOfSymbol [

	self assert: parser language symbolCount > 390
]

{ #category : 'tests' }
TSLanguageMermaidTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '%%{'
]

{ #category : 'tests' }
TSLanguageMermaidTest >> testRetrieveSymbolType [

	self
		assert: (parser language typeOfSymbol: 1)
		equals: TSSymbolType tssymboltypeanonymous 
]
