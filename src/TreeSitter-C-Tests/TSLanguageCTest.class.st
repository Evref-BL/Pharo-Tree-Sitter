Class {
	#name : 'TSLanguageCTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'cLanguage'
	],
	#category : 'TreeSitter-C-Tests',
	#package : 'TreeSitter-C-Tests'
}

{ #category : 'running' }
TSLanguageCTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.

	parser := TSParser new.
	cLanguage := TSLanguage cLang.
	parser language: cLanguage
]

{ #category : 'running' }
TSLanguageCTest >> tearDown [

	"parser delete."
	super tearDown
]

{ #category : 'running' }
TSLanguageCTest >> testCNumberOfSymbol [

	self assert: parser language symbolCount > 360
]

{ #category : 'running' }
TSLanguageCTest >> testCollectAllSymbolOfOneSymbolType [

	 "self skip. " 
	"the size depends on the system we compiled the grammar, on Mac it's 160, on linux (in the CI) it's 161"
	
	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.
	
	self assert: symbols isNotEmpty.
	self assert: symbols size > 150
]

{ #category : 'running' }
TSLanguageCTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]

{ #category : 'running' }
TSLanguageCTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltyperegular
]
