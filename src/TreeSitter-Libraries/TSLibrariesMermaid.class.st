Class {
	#name : 'TSLibrariesMermaid',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesMermaid >> branchToClone [
	"https://github.com/singularity-ng/singularity-parser-mermaid/tree/main/src has one old release tags"

	^ nil
]

{ #category : 'accessing' }
TSLibrariesMermaid >> commandLine [

	^ TSLibrariesCommandLines mermaid 
]

{ #category : 'accessing' }
TSLibrariesMermaid >> languageName [

	^ 'Mermaid'
]

{ #category : 'as yet unclassified' }
TSLibrariesMermaid >> libraryName [

	^ self libraryName: 'libtree-sitter-mermaid'
]

{ #category : 'as yet unclassified' }
TSLibrariesMermaid >> libraryRootInDocuments [

	^ '/singularity-parser-mermaid/'
]

{ #category : 'accessing' }
TSLibrariesMermaid >> repositoryName [

	^ 'singularity-parser-mermaid'
]

{ #category : 'as yet unclassified' }
TSLibrariesMermaid >> repositoryOwner [

	^ 'singularity-ng'
]
