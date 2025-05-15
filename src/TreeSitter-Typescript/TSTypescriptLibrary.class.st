Class {
	#name : 'TSTypescriptLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-Typescript',
	#package : 'TreeSitter-Typescript'
}

{ #category : 'accessing - platform' }
TSTypescriptLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'tree-sitter-typescript.dylib' )  
]

{ #category : 'accessing - platform' }
TSTypescriptLibrary >> tree_sitter_typescript [

	^ self ffiCall: 'TSLanguage * tree_sitter_typescript ()'
]

{ #category : 'accessing - platform' }
TSTypescriptLibrary >> unix64LibraryName [
 
	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'tree-sitter-typescript.so' ) 
]

{ #category : 'accessing - platform' }
TSTypescriptLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('tree-sitter-typescript.dll')
]
