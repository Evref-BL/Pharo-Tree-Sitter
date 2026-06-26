Class {
	#name : 'TSLibrariesPython',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibrariesPython >> commandLine [

	^ TSLibrariesCommandLines python 
]

{ #category : 'accessing' }
TSLibrariesPython >> languageName [

	^ 'Python'
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> libraryName [

	^ self libraryName: 'libtree-sitter-python'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> libraryRootInDocuments [

	^ '/tree-sitter-python/'
]

{ #category : 'accessing' }
TSLibrariesPython >> repositoryName [
	^ 'tree-sitter-python'
]
