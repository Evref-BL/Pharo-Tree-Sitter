Class {
	#name : 'TSLibrariesSCSS',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesSCSS >> commandLine [

	^ TSLibrariesCommandLines scss
]

{ #category : 'accessing' }
TSLibrariesSCSS >> languageName [

	^ 'SCSS'
]

{ #category : 'as yet unclassified' }
TSLibrariesSCSS >> libraryName [

	^ self libraryName: 'libtree-sitter-scss'.
]

{ #category : 'as yet unclassified' }
TSLibrariesSCSS >> libraryRootInDocuments [

	^ '/tree-sitter-scss/'
]

{ #category : 'accessing' }
TSLibrariesSCSS >> repositoryName [
	^ 'tree-sitter-scss'
]

{ #category : 'as yet unclassified' }
TSLibrariesSCSS >> repositoryOwner [

	^ 'tree-sitter-grammars'
]
