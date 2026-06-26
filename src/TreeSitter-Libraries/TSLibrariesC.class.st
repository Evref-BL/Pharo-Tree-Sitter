Class {
	#name : 'TSLibrariesC',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesC >> commandLine [

	^ TSLibrariesCommandLines c
]

{ #category : 'accessing' }
TSLibrariesC >> languageName [

	^ 'C'
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> libraryName [

	^ self libraryName: 'libtree-sitter-c'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> libraryRootInDocuments [

	^ '/tree-sitter-c/'
]

{ #category : 'accessing' }
TSLibrariesC >> repositoryName [
	^ 'tree-sitter-c'
]
