Class {
	#name : 'TSLibrariesGroovy',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesGroovy >> commandLine [

	^ TSLibrariesCommandLines groovy 
]

{ #category : 'accessing' }
TSLibrariesGroovy >> languageName [

	^ 'Groovy'
]

{ #category : 'as yet unclassified' }
TSLibrariesGroovy >> libraryName [

	^ self libraryName: 'libtree-sitter-groovy'
]

{ #category : 'as yet unclassified' }
TSLibrariesGroovy >> libraryRootInDocuments [

	^ '/tree-sitter-groovy/'
]

{ #category : 'accessing' }
TSLibrariesGroovy >> repositoryName [

	^ 'tree-sitter-groovy'
]

{ #category : 'as yet unclassified' }
TSLibrariesGroovy >> repositoryOwner [

	^ 'murtaza64'
]
