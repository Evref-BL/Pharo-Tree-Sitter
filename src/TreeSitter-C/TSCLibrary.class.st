Class {
	#name : 'TSCLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-C',
	#package : 'TreeSitter-C'
}

{ #category : 'accessing - platform' }
TSCLibrary >> macLibraryName [

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-c.dylib' )
]

{ #category : 'as yet unclassified' }
TSCLibrary >> tree_sitter_c [

	^ self ffiCall: 'TSLanguage * tree_sitter_c ()'
]

{ #category : 'as yet unclassified' }
TSCLibrary >> uniqueInstance [

	TSLibrariesC new ensureCLibraryExists.
	^ self
]

{ #category : 'as yet unclassified' }
TSCLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'libtree-sitter-c.so' )
]

{ #category : 'as yet unclassified' }
TSCLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #( 'libtree-sitter-c.dll' )
]
