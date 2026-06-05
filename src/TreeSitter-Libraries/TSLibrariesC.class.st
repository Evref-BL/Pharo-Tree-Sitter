Class {
	#name : 'TSLibrariesC',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesC >> cloneTreeSitterC [

	| clonePath cloneCommand status lastReleasedVersion|
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-c'.

	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter' repo: 'tree-sitter-c' ].
	
	"Execute clone command"
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter/tree-sitter-c.git'
		branch: lastReleasedVersion
		destination: clonePath.

	self logInTranscript:
		'Start cloning Tree-Sitter-c in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter C successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter C clone failed with exit code: '
				, status asString ]
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> ensureCLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterC;
			generateTreeSitterCLibraries ].
	self moveLibraryToPharoVM
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> generateTreeSitterCLibraries [

	| command status |
	command := self platformCommandFor: TSLibrariesCommandLines c.

	self logInTranscript: 'Start generating Tree Sitter C library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter C library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter C library generated successfully' ]
		ifFalse: [
			Error signal:
				'Tree Sitter C library was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> libraryName [

	^ self libraryName: 'libtree-sitter-c'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> libraryRootInDocuments [

	^ '/tree-sitter-c/'
]
