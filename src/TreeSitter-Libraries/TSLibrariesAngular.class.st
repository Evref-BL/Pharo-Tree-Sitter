Class {
	#name : 'TSLibrariesAngular',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesAngular >> commandLine [

	^ TSLibrariesCommandLines angular 
]

{ #category : 'accessing' }
TSLibrariesAngular >> languageName [

	^ 'angular'
]

{ #category : 'accessing' }
TSLibrariesAngular >> libraryName [

	^ self libraryName: 'libtree-sitter-angular'.
]

{ #category : 'accessing' }
TSLibrariesAngular >> libraryRootInDocuments [

	^ '/tree-sitter-angular/'
]

{ #category : 'accessing' }
TSLibrariesAngular >> repositoryName [
	^ 'tree-sitter-angular'
]

{ #category : 'accessing' }
TSLibrariesAngular >> repositoryOwner [

	^ 'dlvandenberg'
]
