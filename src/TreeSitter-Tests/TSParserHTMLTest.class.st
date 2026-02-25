Class {
	#name : 'TSParserHTMLTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'htmlLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserHTMLTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	htmlLanguage := TSLanguage html.
	parser language: htmlLanguage
]

{ #category : 'running' }
TSParserHTMLTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserHTMLTest >> testPositionEndPointInString [

	| string tree |
	string := '<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 127
]

{ #category : 'tests' }
TSParserHTMLTest >> testPositionInString [

	| string tree |
	string := '<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first namedChildren second startPoint)
		equals: 7
]

{ #category : 'tests' }
TSParserHTMLTest >> testRootNodeSymbolSimpleHTMLDocument [

	| string tree |
	string := '<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode symbol equals: 25
]

{ #category : 'tests' }
TSParserHTMLTest >> testRootOfSimpleHMLDocumentHasOneChild [

	| string tree |
	string := '<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'tests' }
TSParserHTMLTest >> testRootOfSimpleHMLDocumentHasOneNamedChild [

	| string tree |
	string := '<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1
]
