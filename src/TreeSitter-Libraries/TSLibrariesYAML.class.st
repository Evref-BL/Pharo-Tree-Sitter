Class {
	#name : 'TSLibrariesYAML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesYAML >> commandLine [

	^ TSLibrariesCommandLines yaml
]

{ #category : 'accessing' }
TSLibrariesYAML >> languageName [

	^ 'YAML'
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> libraryName [

	^ self libraryName: 'libtree-sitter-yaml'.
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> libraryRootInDocuments [

	^ '/tree-sitter-yaml/'
]

{ #category : 'accessing' }
TSLibrariesYAML >> repositoryName [
	^ 'tree-sitter-yaml'
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> repositoryOwner [

	^ 'tree-sitter-grammars'
]
