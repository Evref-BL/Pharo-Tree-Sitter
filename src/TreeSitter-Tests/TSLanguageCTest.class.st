Class {
	#name : 'TSLanguageCTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'cLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSLanguageCTest >> setUp [

	super setUp.

	parser := TSParser new.
	cLanguage := TSLanguage c.
	parser language: cLanguage.
]

{ #category : 'running' }
TSLanguageCTest >> tearDown [

	"parser delete."
	super tearDown
]

{ #category : 'running' }
TSLanguageCTest >> testCollectAllSymbolOfOneSymbolType [

	self
		assert:
		(parser language symbolsOfType: TSSymbolType tssymboltyperegular)
			size
		equals: 130
]
