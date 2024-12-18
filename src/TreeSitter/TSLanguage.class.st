Class {
	#name : 'TSLanguage',
	#superclass : 'FFIOpaqueObject',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'versions' }
TSLanguage >> nameOfSymbol: aSymbol [

	^ TSLibrary uniqueInstance ts_language: self _symbol_name: aSymbol
]

{ #category : 'versions' }
TSLanguage >> symbolCount [

	^ TSLibrary uniqueInstance ts_language_symbol_count: self
]

{ #category : 'versions' }
TSLanguage >> version [

	^ TSLibrary uniqueInstance ts_language_version: self
]
