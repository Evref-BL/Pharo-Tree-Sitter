Class {
	#name : 'TSParserGroovyTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'language'
	],
	#category : 'TreeSitter-Groovy-Tests',
	#package : 'TreeSitter-Groovy-Tests'
}

{ #category : 'running' }
TSParserGroovyTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	language := TSLanguage groovy .
	parser language: language
]

{ #category : 'running' }
TSParserGroovyTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserGroovyTest >> testPositionEndPointInString [

	| string tree |
	string := 'import com.fasterxml.jackson.databind.*

class User {
String name
}' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 39
]

{ #category : 'tests' }
TSParserGroovyTest >> testPositionInString [

	| string tree |
	string := 'import com.fasterxml.jackson.databind.*

class User {
String name
}' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first namedChildren second startPoint)
		equals: 38
]

{ #category : 'tests' }
TSParserGroovyTest >> testRootNodeSymbolSimpleGroovyDocument [

	| string tree |
	string := 'import com.fasterxml.jackson.databind.*

class User {
String name
}' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode symbol equals: 160
]

{ #category : 'tests' }
TSParserGroovyTest >> testRootOfSimpleGroovyDocumentHasOneChild [

	| string tree |
	string := 'import com.fasterxml.jackson.databind.*

class User {
String name
}' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 2
]

{ #category : 'tests' }
TSParserGroovyTest >> testRootOfSimpleGroovyDocumentHasOneNamedChild [

	| string tree |
	string := 'import com.fasterxml.jackson.databind.*

class User {
String name
}' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 2
]
