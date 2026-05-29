Class {
	#name : 'TSYAMLLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-YAML',
	#package : 'TreeSitter-YAML'
}

{ #category : 'accessing - platform' }
TSYAMLLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-yaml.dylib' ) 
]

{ #category : 'as yet unclassified' }
TSYAMLLibrary >> tree_sitter_yaml [

	^ self ffiCall: 'TSLanguage * tree_sitter_yaml ()'
]

{ #category : 'accessing' }
TSYAMLLibrary >> uniqueInstance [

	TSLibrariesYAML new ensureYAMLLibraryExists .
	^ self
]

{ #category : 'accessing - platform' }
TSYAMLLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-yaml.so' )
]

{ #category : 'accessing - platform' }
TSYAMLLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #( 'libtree-sitter-yaml.dll' )
]
