Class {
	#name : 'TSLanguage',
	#superclass : 'FFIOpaqueObject',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'versions' }
TSLanguage >> symbolCount [

	^ TSLibrary uniqueInstance ts_language_symbol_count: self
]

{ #category : 'versions' }
TSLanguage >> version [

	^ TSLibrary uniqueInstance ts_language_version: self
]
