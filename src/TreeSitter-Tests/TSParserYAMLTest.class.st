Class {
	#name : 'TSParserYAMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'yamlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserYAMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	yamlLanguage := TSLanguage yaml.
	parser language: yamlLanguage
]

{ #category : 'running' }
TSParserYAMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserYAMLTest >> testPositionEndPointInString [

	| string tree |
	string := '---
	# A sample yaml example' withPlatformLineEndings.
	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 3
]

{ #category : 'tests' }
TSParserYAMLTest >> testPositionInString [

	| string tree |
	string := '---
	# A sample yaml example' withPlatformLineEndings.
	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second endPoint )
		equals: 28
]

{ #category : 'tests' }
TSParserYAMLTest >> testRootNodeSymbolSimpleYAMLFile [

	| string tree |
	string := '---
	# A sample yaml example' withPlatformLineEndings.
	tree := parser parseString: string. 
	self assert: tree rootNode symbol equals: 106
]

{ #category : 'tests' }
TSParserYAMLTest >> testRootOfSimpleYAMLDocumentHasTwoChild [

	| string tree |
	string := '---
	# A sample yaml example' withPlatformLineEndings.
	tree := parser parseString: string. 
	self assert: tree rootNode childCount equals: 2 
]

{ #category : 'tests' }
TSParserYAMLTest >> testRootOfSimpleYAMLDocumentHasTwoNamedChild [

	| string tree |
	string := '---
	# A sample yaml example' withPlatformLineEndings.
	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 2
]
