Class {
	#name : 'TSLanguageJavaTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'javaLanguage'
	],
	#category : 'TreeSitter-Java-Tests',
	#package : 'TreeSitter-Java-Tests'
}

{ #category : 'running' }
TSLanguageJavaTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	javaLanguage := TSLanguage java.
	parser language: javaLanguage
]

{ #category : 'running' }
TSLanguageJavaTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSLanguageJavaTest >> testCollectAllSymbolOfOneSymbolType [
	
	|symbols|
	
	symbols := 	parser language symbolsOfType: TSSymbolType tssymboltyperegular.
	
	self assert: symbols isNotEmpty .
	self assert: symbols size > 140.
]

{ #category : 'tests' }
TSLanguageJavaTest >> testJavaNumberOfSymbol [

	self assert: parser language symbolCount > 320
]

{ #category : 'tests' }
TSLanguageJavaTest >> testRetrieveSymbolName [

	self assert: (parser language nameOfSymbol: 1) equals: 'identifier'
]

{ #category : 'tests' }
TSLanguageJavaTest >> testRetrieveSymbolType [

	self assert: (parser language typeOfSymbol: 1) equals: TSSymbolType tssymboltyperegular 
]
