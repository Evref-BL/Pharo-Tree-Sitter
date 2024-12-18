Class {
	#name : 'TSLanguage',
	#superclass : 'FFIOpaqueObject',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'accessing' }
TSLanguage >> nameOfSymbol: aSymbol [

	^ TSLibrary uniqueInstance ts_language: self _symbol_name: aSymbol
]

{ #category : 'accessing' }
TSLanguage >> symbolCount [

	^ TSLibrary uniqueInstance ts_language_symbol_count: self
]

{ #category : 'utils' }
TSLanguage >> symbolsOfType: aTSSymbolType [

	| collection |
	collection := OrderedCollection new.
	0 to: self symbolCount do: [ :idx |
		(self typeOfSymbol: idx) = aTSSymbolType ifTrue: [
			collection add: idx ] ].
	^ collection
]

{ #category : 'accessing' }
TSLanguage >> typeOfSymbol: aSymbol [

	^ TSLibrary uniqueInstance ts_language: self _symbol_type: aSymbol
]

{ #category : 'accessing' }
TSLanguage >> version [

	^ TSLibrary uniqueInstance ts_language_version: self
]
