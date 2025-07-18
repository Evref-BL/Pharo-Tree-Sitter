"
I am just an utility to make TSSymbolExplorerPresenter work.

I represent a field of a TSNode symbol and the possible children I can have
"
Class {
	#name : 'TSFieldExplorerWrapper',
	#superclass : 'Object',
	#instVars : [
		'field',
		'symbols'
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
TSFieldExplorerWrapper >> addAll: aColl [

	symbols addAll: aColl
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
	symbols := Set new
]

{ #category : 'accessing' }
TSFieldExplorerWrapper >> symbols [
	^ symbols
]
