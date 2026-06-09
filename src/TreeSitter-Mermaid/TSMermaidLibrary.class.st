Class {
	#name : 'TSMermaidLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-Mermaid',
	#package : 'TreeSitter-Mermaid'
}

{ #category : 'accessing - platform' }
TSMermaidLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-mermaid.dylib' )  
]

{ #category : 'as yet unclassified' }
TSMermaidLibrary >> tree_sitter_mermaid [

	^ self ffiCall: 'TSLanguage * tree_sitter_mermaid ()'
]

{ #category : 'accessing' }
TSMermaidLibrary >> uniqueInstance [

	TSLibrariesMermaid new ensureTreeSitterLibraryExists.
	^ self
]

{ #category : 'accessing - platform' }
TSMermaidLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary:
		  #( 'libtree-sitter-mermaid.so' )
]

{ #category : 'as yet unclassified' }
TSMermaidLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('mermaid.dll')
]
