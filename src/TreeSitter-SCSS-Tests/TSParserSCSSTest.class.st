Class {
	#name : 'TSParserSCSSTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'language'
	],
	#category : 'TreeSitter-SCSS-Tests',
	#package : 'TreeSitter-SCSS-Tests'
}

{ #category : 'running' }
TSParserSCSSTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	language := TSLanguage scss.
	parser language: language 
]

{ #category : 'running' }
TSParserSCSSTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserSCSSTest >> testChildrenCollection [

	| string tree |
	string := '$color: blue;

.box {
  color: $color;
  &:hover { color: darken($color, 10%); }
}' withPlatformLineEndings.

	tree := parser parseString: string. 
	
	self assert: tree rootNode collectNamedChild size equals: 2. 
	self assert: tree rootNode firstNamedChild collectNamedChild size equals: 2.
	self assert: tree rootNode firstNamedChild firstNamedChild collectNamedChild size equals: 0. 
]

{ #category : 'tests' }
TSParserSCSSTest >> testParseSCSSVariableAndClass [

	| string tree |
	string := '$color: blue;

.box {
  color: $color;
  &:hover { color: darken($color, 10%); }
}' withPlatformLineEndings.

	tree := parser parseString: string.  
	self assert: tree rootNode namedChildCount equals: 2.
	self assert: tree rootNode namedChildren first type equals: 'declaration'.
	
	
]
