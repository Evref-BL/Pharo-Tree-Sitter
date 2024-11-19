Class {
	#name : #TSGroovyLibrary,
	#superclass : #FFILibrary,
	#category : #'TreeSitter-Groovy'
}

{ #category : #'accessing - platform' }
TSGroovyLibrary >> macLibraryName [ 
		^ FFIMacLibraryFinder findAnyLibrary: #( 'groovy.dylib' )
]

{ #category : #'as yet unclassified' }
TSGroovyLibrary >> tree_sitter_groovy [

	^ self ffiCall: 'TSLanguage * tree_sitter_groovy ()'
]

{ #category : #'accessing - platform' }
TSGroovyLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'libtree-sitter-groovy.so' )
]

{ #category : #'accessing - platform' }
TSGroovyLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('groovy.dll')
]
