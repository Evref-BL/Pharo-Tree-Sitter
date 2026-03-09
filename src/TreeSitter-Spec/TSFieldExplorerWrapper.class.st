"
I am just an utility to make TSSymbolExplorerPresenter work.

I represent a field of a TSNode symbol and the possible children I can have
"
Class {
	#name : 'TSFieldExplorerWrapper',
	#superclass : 'Object',
	#instVars : [
		'field',
		'symbolsAndCode',
		'minSize',
		'maxSize'
	],
	#category : 'TreeSitter-Spec',
	#package : 'TreeSitter-Spec'
}

{ #category : 'as yet unclassified' }
TSFieldExplorerWrapper class >> field: aSymbol [

	^ self new
		  field: aSymbol;
		  yourself
]

{ #category : 'adding' }
TSFieldExplorerWrapper >> addAll: aColl code: aString [

	"I save the min and max number of children I can have to display this info to the user."
	minSize := minSize
		           ifNil: [ aColl size ]
		           ifNotNil: [ minSize min: aColl size ].
	maxSize := maxSize
		           ifNil: [ aColl size ]
		           ifNotNil: [ maxSize max: aColl size ].
	aColl do: [ :node | (symbolsAndCode keys includes: node type) ifFalse: [ symbolsAndCode at: node type put: (node parent textFromSourceText: aString) ] ]
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> codeOf: symbol [

	^ symbolsAndCode at: symbol ifAbsent: [ 'Nothing' ]
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> field [
	^ field
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> field: anObject [
	field := anObject
]

{ #category : 'initialization' }
TSFieldExplorerWrapper >> initialize [

	super initialize.
	symbolsAndCode := OrderedDictionary new
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> isOptional [

	^ minSize isNotNil and: [ minSize = 0 ]
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> isOptional: anObject [

	anObject ifTrue: [ minSize := 0 ]
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> maxSize [
	^ maxSize
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> minSize [
	^ minSize
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> symbols [

	^ symbolsAndCode keys
]
