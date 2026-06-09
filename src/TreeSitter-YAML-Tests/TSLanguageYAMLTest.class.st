Class {
	#name : 'TSLanguageYAMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'yamlLanguage'
	],
	#category : 'TreeSitter-YAML-Tests',
	#package : 'TreeSitter-YAML-Tests'
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
 
	|symbols|

	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty. 
	self assert: symbols size > 150

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
TSLanguageYAMLTest >> testYamlNumberOfSymbol [

	self assert: parser language symbolCount equals: 293
]
