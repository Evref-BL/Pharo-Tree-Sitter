Class {
	#name : 'TSLibrariesJava',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesJava >> commandLine [

	^ TSLibrariesCommandLines java
]

{ #category : 'accessing' }
TSLibrariesJava >> languageName [

	^ 'Java'
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> libraryName [

	^ self libraryName: 'libtree-sitter-java'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> libraryRootInDocuments [

	^ '/tree-sitter-java/'
]

{ #category : 'accessing' }
TSLibrariesJava >> repositoryName [
	^ 'tree-sitter-java'
]
