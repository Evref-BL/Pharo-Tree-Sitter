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

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> cssLibraryExistsInDocuments [

	^ (self originalLibrariesDirectory asFileReference / self libraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> ensureCSSLibraryExists [

	self libraryExists ifFalse: [
		self cssLibraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterCSS ;
				generateTreeSitterCSSLibraries ].
		self moveCSSLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> generateTreeSitterCSSLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLinesCSS new.
	self isMacOS
		ifTrue: [ command := cmdLines cmdMacTreeSitterCSS ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := cmdLines cmdWindowsTreeSitterCSS ]
				ifFalse: [ command := cmdLines cmdLinuxTreeSitterCSS ] ].

	self logInTranscript: 'Start generating Tree Sitter CSS library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter CSS library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter CSS generated successfully' ]
		ifFalse: [
			Error signal:
				'Tree Sitter CSS was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> libraryName [

	^ self libraryName: 'libtree-sitter-css'.
]

{ #category : 'as yet unclassified' }
TSLibrariesCSS >> moveCSSLibraryToPharoVM [

	self moveLibrary: self libraryName from: '/tree-sitter-css/'

]
