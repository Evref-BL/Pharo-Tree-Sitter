Class {
	#name : 'TSLibrariesTypescript',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> afterGenerateTreeSitterLibrary [

	(TSLibrariesTypescript new originalLibrariesDirectory
	 , '/tree-sitter-typescript/common/tree_sitter') asFileReference
		deleteAll
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> beforeGenerateTreeSitterLibrary [

	| source target destination |
	source := (self originalLibrariesDirectory
	           , '/tree-sitter-typescript/typescript/src/tree_sitter')
		          asFileReference.

	target := (self originalLibrariesDirectory
	           , '/tree-sitter-typescript/common/') asFileReference.

	destination := target / source basename.
	destination ensureCreateDirectory.

	"Copy the the content of tree_sitter folder in the new destination in common"
	source copyAllTo: destination
]

{ #category : 'accessing' }
TSLibrariesTypescript >> commandLine [

	^ TSLibrariesCommandLines typescript 
]

{ #category : 'accessing' }
TSLibrariesTypescript >> languageName [

	^ 'TypeScript'
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> libraryName [

	^ self libraryName: 'libtree-sitter-typescript'
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> libraryRootInDocuments [

	^ '/tree-sitter-typescript/typescript/'
]

{ #category : 'accessing' }
TSLibrariesTypescript >> repositoryName [
	^ 'tree-sitter-typescript'
]
