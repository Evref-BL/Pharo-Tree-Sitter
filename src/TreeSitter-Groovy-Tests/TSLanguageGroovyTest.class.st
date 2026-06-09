Class {
	#name : 'TSLanguageGroovyTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'language'
	],
	#category : 'TreeSitter-Groovy-Tests',
	#package : 'TreeSitter-Groovy-Tests'
}

{ #category : 'running' }
TSLanguageGroovyTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	language := TSLanguage groovy.
	parser language: language
]

{ #category : 'running' }
TSLanguageGroovyTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageGroovyTest >> testCollectAllSymbolOfOneSymbolType [

	| symbols |
	symbols := parser language symbolsOfType:
		           TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 80
]

{ #category : 'tests' }
TSLanguageGroovyTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]

{ #category : 'tests' }
TSLanguageGroovyTest >> testRetrieveSymbolType [

	self
		assert: (parser language typeOfSymbol: 1)
		equals: TSSymbolType tssymboltyperegular 
]

{ #category : 'tests' }
TSLanguageGroovyTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount > 250
]
