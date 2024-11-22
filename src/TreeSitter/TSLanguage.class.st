Class {
	#name : 'TSLanguage',
	#superclass : 'FFIOpaqueObject',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'versions' }
TSLanguage >> version [

	^ TSLibrary uniqueInstance ts_language_version: self
]
