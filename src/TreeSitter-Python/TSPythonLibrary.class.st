Class {
	#name : 'TSPythonLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-Python',
	#package : 'TreeSitter-Python'
}

{ #category : 'accessing - platform' }
TSPythonLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-python.dylib' )  
]

{ #category : 'accessing - platform' }
TSPythonLibrary >> tree_sitter_python [

	^ self ffiCall: 'TSLanguage * tree_sitter_python ()'
]

{ #category : 'accessing' }
TSPythonLibrary >> uniqueInstance [

	TSLibrariesPython new ensurePythonLibraryExists.
	^ self
]

{ #category : 'accessing - platform' }
TSPythonLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-python.so' )
]

{ #category : 'accessing - platform' }
TSPythonLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #( 'libtree-sitter-python.dll' )
]
