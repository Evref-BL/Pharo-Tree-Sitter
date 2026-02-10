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
		'isOptional'
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
	symbolsAndCode := OrderedDictionary new.
	isOptional := false
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> isOptional [
	^ isOptional
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> isOptional: anObject [
	isOptional := anObject
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> symbols [

	^ symbolsAndCode keys
]
