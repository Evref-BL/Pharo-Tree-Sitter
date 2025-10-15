Class {
	#name : 'TSXMLLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-XML',
	#package : 'TreeSitter-XML'
}

{ #category : 'accessing - platform' }
TSXMLLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter-xml.dylib' )  
]

{ #category : 'as yet unclassified' }
TSXMLLibrary >> tree_sitter_xml [

	^ self ffiCall: 'TSLanguage * tree_sitter_xml ()'
]

{ #category : 'accessing' }
TSXMLLibrary >> uniqueInstance [

	TSLibrariesXML new ensureXMLLibraryExists .
	^ self
]
