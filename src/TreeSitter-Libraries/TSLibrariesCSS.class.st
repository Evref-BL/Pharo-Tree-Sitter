Class {
	#name : 'TSLibrariesCSS',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesCSS >> commandLine [
	^ TSLibrariesCommandLines css 
]

{ #category : 'accessing' }
TSLibrariesCSS >> languageName [

	^ 'CSS'
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> libraryName [

	^ self libraryName: 'libtree-sitter-css'.
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> libraryRootInDocuments [

	^ '/tree-sitter-css/'
]

{ #category : 'accessing' }
TSLibrariesCSS >> repositoryName [
	^ 'tree-sitter-css'
]
