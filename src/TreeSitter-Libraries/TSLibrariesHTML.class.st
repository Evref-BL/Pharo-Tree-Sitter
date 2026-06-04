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

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> ensureHTMLLibraryExists [

	self libraryExists ifFalse: [
		self htmlLibraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterHTML ;
				generateTreeSitterHTMLLibraries ].
		self moveHTMLLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> generateTreeSitterHTMLLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLinesHTML new.
	self isMacOS
		ifTrue: [ command := cmdLines cmdMacTreeSitterHTML ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := cmdLines cmdWindowsTreeSitterHTML ]
				ifFalse: [ command := cmdLines cmdLinuxTreeSitterHTML ] ].

	self logInTranscript: 'Start generating Tree Sitter HTML library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter HTML library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter HTML generated successfully' ]
		ifFalse: [
			Error signal:
				'Tree Sitter HTML was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> htmlLibraryExistsInDocuments [

	^ (self originalLibrariesDirectory asFileReference / self libraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> libraryName [

	^ self libraryName: 'libtree-sitter-html'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesHTML >> moveHTMLLibraryToPharoVM [

	self moveLibrary: self libraryName from: '/tree-sitter-html/'

]
