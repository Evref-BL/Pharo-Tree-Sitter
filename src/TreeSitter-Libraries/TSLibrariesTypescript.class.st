Class {
	#name : 'TSLibrariesTypescript',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> afterGenerateTreeSitterLibrary [
	self deleteTreeSitterFolderInCommon
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> beforeGenerateTreeSitterLibrary [
	self copyFoldersInTreeSitterTypescript

]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> cloneTreeSitterTypescript [

	| clonePath cloneCommand status lastReleasedVersion|
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-typescript'.
	
	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter' repo: 'tree-sitter-typescript' ].
 
	"Execute clone command"
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter/tree-sitter-typescript.git'
		branch: lastReleasedVersion
		destination: clonePath.

	self logInTranscript:
		'Start cloning Tree-Sitter-typescript in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter Typescript successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter Typescript clone failed with exit code: '
				, status asString ]
]

{ #category : 'accessing' }
TSLibrariesTypescript >> commandLine [

	^ TSLibrariesCommandLines typescript 
]

{ #category : 'copying' }
TSLibrariesTypescript >> copyFoldersInTreeSitterTypescript [

	| source target destination |
	source := (self originalLibrariesDirectory
	           , '/tree-sitter-typescript/typescript/src/tree_sitter')
		          asFileReference.

	target := (self originalLibrariesDirectory
	           , '/tree-sitter-typescript/common/') asFileReference.

	destination := target / source basename.
	destination ensureCreateDirectory.

	"Copy the the content of tree_sitter folder in the new destination in common"
	source copyAllTo: destination.
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> deleteTreeSitterFolderInCommon [ 

	(TSLibrariesTypescript new originalLibrariesDirectory
	           , '/tree-sitter-typescript/common/tree_sitter') asFileReference deleteAll.
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> ensureTypescriptLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterTypescript;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
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
