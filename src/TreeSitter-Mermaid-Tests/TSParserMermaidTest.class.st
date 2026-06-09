Class {
	#name : 'TSParserMermaidTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'language'
	],
	#category : 'TreeSitter-Mermaid-Tests',
	#package : 'TreeSitter-Mermaid-Tests'
}

{ #category : 'running' }
TSParserMermaidTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	language := TSLanguage python.
	parser language: language
]

{ #category : 'running' }
TSParserMermaidTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserMermaidTest >> testPositionEndPointInString [

	| string tree |
	string := 'stateDiagram-v2
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 15
]

{ #category : 'as yet unclassified' }
TSParserMermaidTest >> testPositionInString [

	| string tree |
	string := 'stateDiagram-v2
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren second startPoint)
		equals: 20
]

{ #category : 'as yet unclassified' }
TSParserMermaidTest >> testRootNodeSymbolSimpleMermaidProgram [

	| string tree |
	string := 'stateDiagram-v2
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]'.

	tree := parser parseString: string. 
	self assert: tree rootNode symbol equals: 108
]

{ #category : 'as yet unclassified' }
TSParserMermaidTest >> testRootOfSimpleMermaidHasOneChild [

	| string tree |
	string := 'stateDiagram-v2
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]'.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'as yet unclassified' }
TSParserMermaidTest >> testRootOfSimpleMermaidHasOneNamedChild [

	| string tree |
	string := 'stateDiagram-v2
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]'.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1
]
