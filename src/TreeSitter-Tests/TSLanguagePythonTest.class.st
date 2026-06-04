Class {
	#name : 'TSLanguagePythonTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'pythonLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguagePythonTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage
]

{ #category : 'running' }
TSLanguagePythonTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguagePythonTest >> testCollectAllSymbolOfOneSymbolType [

	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 125
]

{ #category : 'tests' }
TSLanguagePythonTest >> testPythonNumberOfSymbol [

	self assert: parser language symbolCount > 270
]

{ #category : 'tests' }
TSLanguagePythonTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]

{ #category : 'tests' }
TSLanguagePythonTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltyperegular
]
