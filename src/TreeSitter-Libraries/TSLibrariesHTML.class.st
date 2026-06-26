Class {
	#name : 'TSLibrariesHTML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesHTML >> commandLine [

	^ TSLibrariesCommandLines html
]

{ #category : 'accessing' }
TSLibrariesHTML >> languageName [

	^ 'HTML'
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> libraryName [

	^ self libraryName: 'libtree-sitter-html'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> libraryRootInDocuments [

	^ '/tree-sitter-html/'
]

{ #category : 'accessing' }
TSLibrariesHTML >> repositoryName [
	^ 'tree-sitter-html'
]
