Class {
	#name : 'TSHTMLLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-HTML',
	#package : 'TreeSitter-HTML'
}

{ #category : 'accessing - platform' }
TSHTMLLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-html.dylib' )
]

{ #category : 'as yet unclassified' }
TSHTMLLibrary >> tree_sitter_html [

	^ self ffiCall: 'TSLanguage * tree_sitter_html ()'
]

{ #category : 'accessing' }
TSHTMLLibrary >> uniqueInstance [

	TSLibrariesHTML new ensureHTMLLibraryExists .
	^ self
]

{ #category : 'accessing - platform' }
TSHTMLLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-html.so' )
]

{ #category : 'accessing - platform' }
TSHTMLLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #( 'libtree-sitter-html.dll' )
]
