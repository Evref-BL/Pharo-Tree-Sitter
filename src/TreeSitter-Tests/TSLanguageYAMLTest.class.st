Class {
	#name : 'TSLanguageYAMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'yamlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageYAMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	yamlLanguage := TSLanguage yaml.
	parser language: yamlLanguage
]

{ #category : 'running' }
TSLanguageYAMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageYAMLTest >> testCollectAllSymbolOfOneSymbolType [

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 156
]

{ #category : 'tests' }
TSLanguageYAMLTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '_eof'
]

{ #category : 'tests' }
TSLanguageYAMLTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 3) equals: TSSymbolType tssymboltyperegular
]

{ #category : 'tests' }
TSLanguageYAMLTest >> testTypescriptNumberOfSymbol [

	self assert: parser language symbolCount equals: 293
]
