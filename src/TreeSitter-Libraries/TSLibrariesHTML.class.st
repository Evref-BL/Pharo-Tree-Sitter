Class {
	#name : 'TSLibrariesHTML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> cloneTreeSitterHTML [

	| clonePath cloneCommand status lastReleasedVersion|
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-html'.

	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter' repo: 'tree-sitter-html' ].

	"Execute clone command" 
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter/tree-sitter-html.git'
		branch: lastReleasedVersion
		destination: clonePath.

	self logInTranscript:
		'Start cloning Tree-Sitter-HTML in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter HTML successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter HTML clone failed with exit code: '
				, status asString ]
]

{ #category : 'accessing' }
TSLibrariesHTML >> commandLine [

	^ TSLibrariesCommandLines html
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> ensureHTMLLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterHTML;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
]

{ #category : 'accessing' }
TSLibrariesHTML >> languageName [

	^ 'HTML'
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> libraryName [

	^ self libraryName: 'libtree-sitter-html'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> libraryRootInDocuments [

	^ '/tree-sitter-html/'
]
