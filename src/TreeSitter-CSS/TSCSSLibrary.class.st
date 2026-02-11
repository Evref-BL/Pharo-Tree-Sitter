Class {
	#name : 'TSCSSLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-CSS',
	#package : 'TreeSitter-CSS'
}

{ #category : 'accessing - platform' }
TSCSSLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-css.dylib' )  
]

{ #category : 'as yet unclassified' }
TSCSSLibrary >> tree_sitter_css [

	^ self ffiCall: 'TSLanguage * tree_sitter_css ()'
]

{ #category : 'accessing' }
TSCSSLibrary >> uniqueInstance [

	TSLibrariesCSS new ensureCSSLibraryExists .
	^ self
]

{ #category : 'accessing - platform' }
TSCSSLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-css.so' )
]

{ #category : 'accessing - platform' }
TSCSSLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #( 'libtree-sitter-css.dll' )
]
