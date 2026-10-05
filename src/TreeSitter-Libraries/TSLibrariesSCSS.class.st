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

{ #category : 'accessing' }
TSLibrariesSCSS >> libraryName [  

	^ self libraryName: 'libtree-sitter-scss'. 
]

{ #category : 'accessing' }
TSLibrariesSCSS >> libraryRootInDocuments [ 

	^ '/tree-sitter-scss/' 
]

{ #category : 'accessing' }
TSLibrariesSCSS >> repositoryName [  
	^ 'tree-sitter-scss' 
]

{ #category : 'accessing' }
TSLibrariesSCSS >> repositoryOwner [

	^ 'tree-sitter-grammars' 
]
