Class {
	#name : 'TSLanguageAngularTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'angularDSL'
	],
	#category : 'TreeSitter-Angular-Tests',
	#package : 'TreeSitter-Angular-Tests'
}

{ #category : 'running' }
TSLanguageAngularTest >> setUp [
	super setUp.

	self timeLimit: 120 seconds.
	parser := TSParser new.
	angularDSL := TSLanguage angular.
	parser language: angularDSL
]

{ #category : 'running' }
TSLanguageAngularTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageAngularTest >> testAngularNumberOfSymbol [

	self assert: parser language symbolCount > 245
]

{ #category : 'tests' }
TSLanguageAngularTest >> testCollectAllSymbolOfOneSymbolType [

	|symbols|
	
	symbols := parser language symbolsOfType: TSSymbolType tssymboltyperegular.

	self assert: symbols isNotEmpty.
	self assert: symbols size > 125
]

{ #category : 'tests' }
TSLanguageAngularTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: '<!'
]

{ #category : 'tests' }
TSLanguageAngularTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltypeanonymous 
]
