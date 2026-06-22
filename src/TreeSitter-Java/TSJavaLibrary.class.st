Class {
	#name : 'TSJavaLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-Java',
	#package : 'TreeSitter-Java'
}

{ #category : 'accessing - platform' }
TSJavaLibrary >> macLibraryName [
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-java.dylib' )
]

{ #category : 'accessing - platform' }
TSJavaLibrary >> tree_sitter_java [

	^ self ffiCall: 'TSLanguage * tree_sitter_java ()'
]

{ #category : 'accessing' }
TSJavaLibrary >> uniqueInstance [

	TSLibrariesJava new ensureJavaLibraryExists.
	^ self
]

{ #category : 'accessing - platform' }
TSJavaLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-java.so' )
]

{ #category : 'accessing - platform' }
TSJavaLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-java.dll' )
]
