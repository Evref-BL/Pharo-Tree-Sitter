Class {
	#name : 'TSLibrariesXML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesXML >> commandLine [

	^ TSLibrariesCommandLines  xml
]

{ #category : 'accessing' }
TSLibrariesXML >> languageName [

	^ 'XML'
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> libraryName [

	^ self libraryName: 'libtree-sitter-xml'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> libraryRootInDocuments [

	^ '/tree-sitter-xml/xml/'
]

{ #category : 'accessing' }
TSLibrariesXML >> repositoryName [
	^ 'tree-sitter-xml'
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> repositoryOwner [
	^ 'tree-sitter-grammars'
]
