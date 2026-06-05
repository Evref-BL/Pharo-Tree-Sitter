Class {
	#name : 'TSLibrariesCSS',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> cloneTreeSitterCSS [

	| clonePath cloneCommand status lastReleasedVersion|
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-css'.

	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter' repo: 'tree-sitter-css' ].

	"Execute clone command"  
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter/tree-sitter-css.git'
		branch: lastReleasedVersion
		destination: clonePath.
	

	self logInTranscript:
		'Start cloning Tree-Sitter-CSS in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter CSS successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter CSS clone failed with exit code: '
				, status asString ]
]

{ #category : 'accessing' }
TSLibrariesCSS >> commandLine [
	^ TSLibrariesCommandLines css 
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> ensureCSSLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterCSS;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
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
