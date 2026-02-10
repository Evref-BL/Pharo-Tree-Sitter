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

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 129
]

{ #category : 'tests' }
TSLanguagePythonTest >> testPythonNumberOfSymbol [

	self assert: parser language symbolCount equals: 274
]

{ #category : 'tests' }
TSLanguagePythonTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]

{ #category : 'tests' }
TSLanguagePythonTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltyperegular
]
