Class {
	#name : 'TSLibraries',
	#superclass : 'Object',
	#classVars : [
		'GitBranchToUse'
	],
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'accessing' }
TSLibraries class >> gitBranchToUse [

	^ GitBranchToUse
]

{ #category : 'accessing' }
TSLibraries class >> gitBranchToUse: aString [

	GitBranchToUse := aString
]

{ #category : 'as yet unclassified' }
TSLibraries >> cloneTreeSitter [

	| clonePath cloneCommand status lastReleasedVersion |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter'.
	
	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter' repo: 'tree-sitter' ].

	"Execute clone command"
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter/tree-sitter.git'
		branch: lastReleasedVersion
		destination: clonePath.

	self logInTranscript: 'Start cloning TreeSitter in ' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter clone failed with exit code: ' , status asString ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> ensureTreeSitterLibraryExists [
	
	self libraryExists ifFalse: [
		self libraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitter;
				generateTreeSitterLibraries ].

		self moveLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLines new.

	self isMacOS
		ifTrue: [ command := cmdLines cmdMacTreeSitter ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := cmdLines cmdWindowsTreeSitter ]
				ifFalse: [ command := cmdLines cmdLinuxTreeSitter ] ].

	self logInTranscript: 'Start generating TreeSitter library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'TreeSitter library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
		self logInTranscript: 'TreeSitter library generated successfully' ]
		ifFalse: [
			Error signal:
				'TreeSitter library was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibraries >> gitCloneCommandFor: repositoryUrl branch: branchName destination: clonePath [ 

	branchName ifNil: [
		^ 'git clone --depth 1 ', repositoryUrl, ' ', clonePath ].
 
	^ 'git clone --branch ', branchName, ' --depth 1 ', repositoryUrl, ' ', clonePath
]

{ #category : 'testing' }
TSLibraries >> isLinux [
	"Smalltalk os isLinux"

	^ OSPlatform current isLinux
]

{ #category : 'testing' }
TSLibraries >> isMacOS [ 

	^ OSPlatform current isMacOS
]

{ #category : 'testing' }
TSLibraries >> isMainTreeSitterLibrary [

	^ (self libraryName copyUpTo: $.)  = 'libtree-sitter'
]

{ #category : 'testing' }
TSLibraries >> isWindows [

	^ OSPlatform current isWindows
]

{ #category : 'as yet unclassified' }
TSLibraries >> latestReleaseTagForOwner: owner repo: repoName [
	"I am a method that uses github apis to get the latest release version of a repo based on its name and its owner. If HTTPS is not available in the current VM, answer nil so callers can fall back to a plain git clone."
	| url json client body status |
	url := 'https://api.github.com/repos/' , owner , '/' , repoName
	       , '/releases/latest'.

	client := ZnClient new.

	^ [
	  client beOneShot.
	  client url: url.

	  body := client get.
	  status := client response status.

	  status = 200 ifFalse: [
		  self error: 'Cannot fetch latest release for ' , repoName ].

	  json := NeoJSONReader fromString: body.
	  json at: 'tag_name' ] ensure: [ client close ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> libraryExists [ 
	^ (self vmLibrariesDirectory / self libraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibraries >> libraryExistsInDocuments [

	^ ((self originalLibrariesDirectory , self libraryRootInDocuments)
		  asFileReference / self libraryName)  exists
]

{ #category : 'accessing' }
TSLibraries >> libraryName [

	^ self libraryName: 'libtree-sitter'.
]

{ #category : 'as yet unclassified' }
TSLibraries >> libraryName: aName [

	self isWindows
		ifTrue: [ ^ aName , '.dll' ]
		ifFalse: [
			self isMacOS
				ifTrue: [ ^ aName , '.dylib' ]
				ifFalse: [ ^ aName , '.so' ] ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> libraryRootInDocuments [

	self isWindows
		ifTrue: [ ^ '\tree-sitter\build\' ]
		ifFalse: [ ^ '/tree-sitter/' ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> logInTranscript: aMessage [

	Transcript
		show: aMessage;
		cr
]

{ #category : 'as yet unclassified' }
TSLibraries >> moveLibrary: aLibraryName from: initialLocation [

	| source target |
	source := (self originalLibrariesDirectory , initialLocation
	           , aLibraryName) asFileReference.
	target := self vmLibrariesDirectory / aLibraryName .
	source copyTo: target
]

{ #category : 'as yet unclassified' }
TSLibraries >> moveLibraryToPharoVM [
	self moveLibrary: self libraryName from: self libraryRootInDocuments
]

{ #category : 'as yet unclassified' }
TSLibraries >> originalLibrariesDirectory [
	"check if this works for any OS"

	^ FileLocator documents fullName , '/tree-sitter-libraries'
]

{ #category : 'as yet unclassified' }
TSLibraries >> platformCommandFor: aCmdLines [

	self isMacOS ifTrue: [ ^ aCmdLines cmdMac ].
	self isWindows ifTrue: [ ^ aCmdLines cmdWindows ].
	^ aCmdLines cmdLinux
]

{ #category : 'as yet unclassified' }
TSLibraries >> vmLibrariesDirectory [

	| dir |
	"Different for each OS"
	self isWindows
		ifTrue: [ dir := Smalltalk vm directory ]
		ifFalse: [
			self isMacOS
				ifTrue: [
				dir := Smalltalk vm directory
				       , '/Pharo.app/Contents/MacOS/Plugins' ]
				ifFalse: [
				dir := Smalltalk vm directory ] ].

	^ dir asFileReference
]
