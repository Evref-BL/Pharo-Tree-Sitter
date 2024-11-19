Class {
	#name : #TSLanguage,
	#superclass : #FFIOpaqueObject,
	#category : 'TreeSitter'
}

{ #category : #versions }
TSLanguage >> version [

	^ TSLibrary uniqueInstance ts_language_version: self
]
