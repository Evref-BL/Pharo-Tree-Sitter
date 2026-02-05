"
I am here to parse only once the source code
"
Class {
	#name : 'TSNodeTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'parser',
		'rootNode',
		'stringToParse'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'parsing' }
TSNodeTestResource >> parseFunction [

	stringToParse := self sourceCode.
	^ parser parseString: stringToParse
]

{ #category : 'accessing' }
TSNodeTestResource >> rootNode [
	^ rootNode
]

{ #category : 'running' }
TSNodeTestResource >> setUp [

	| tree |
	super setUp.
	parser := TSParser new.
	parser language: TSLanguage typescript.
	tree := self parseFunction.
	rootNode := tree rootNode
]

{ #category : 'accessing' }
TSNodeTestResource >> sourceCode [
	"We add a non ascii character to ensure encoding is well managed."

	^ 'function deleteUser(user: User) {
  					// This is a comment é
				 }'
]

{ #category : 'running' }
TSNodeTestResource >> tearDown [

	parser delete.
	super tearDown
]
