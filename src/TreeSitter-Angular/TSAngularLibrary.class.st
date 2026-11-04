Class {
	#name : 'TSAngularLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-Angular',
	#package : 'TreeSitter-Angular'
}

{ #category : 'accessing - platform' }
TSAngularLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-angular.dylib' )  
]

{ #category : 'as yet unclassified' }
TSAngularLibrary >> tree_sitter_angular [

	^ self ffiCall: 'TSLanguage * tree_sitter_angular ()'
]

{ #category : 'as yet unclassified' }
TSAngularLibrary >> uniqueInstance [

	TSLibrariesAngular new ensureTreeSitterLibraryExists.
	^ self
]

{ #category : 'accessing - platform' }
TSAngularLibrary >> unix64LibraryName [
 
	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'libtree-sitter-angular.so' ) 
]

{ #category : 'accessing - platform' }
TSAngularLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('libtree-sitter-angular.dll')
]
