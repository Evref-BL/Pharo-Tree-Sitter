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

	parser := TSParser new.
	pythonLanguage := TSLanguage python.
	parser language: pythonLanguage.
]

{ #category : 'running' }
TSLanguagePythonTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguagePythonTest >> testPythonNumberOfSymbol [

	self assert: parser language symbolCount equals: 275
]

{ #category : 'tests' }
TSLanguagePythonTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]
