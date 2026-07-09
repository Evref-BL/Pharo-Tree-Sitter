Class {
	#name : 'TSSCSSLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-SCSS',
	#package : 'TreeSitter-SCSS'
}

{ #category : 'accessing - platform' }
TSSCSSLibrary >> macLibraryName [  
	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-scss.dylib' )
]

{ #category : 'as yet unclassified' }
TSSCSSLibrary >> tree_sitter_scss [

	^ self ffiCall: 'TSLanguage * tree_sitter_scss ()'
]

{ #category : 'accessing' }
TSSCSSLibrary >> uniqueInstance [

	TSLibrariesSCSS new ensureTreeSitterLibraryExists.
	^ self
]

{ #category : 'accessing - platform' }
TSSCSSLibrary >> unix64LibraryName [
 
	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'libtree-sitter-scss.so' ) 
]

{ #category : 'accessing - platform' }
TSSCSSLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('libtree-sitter-scss.dll')
]
