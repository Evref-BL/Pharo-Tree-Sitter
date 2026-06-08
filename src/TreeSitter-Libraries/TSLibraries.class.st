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
TSLibraries >> afterGenerateTreeSitterLibrary [
	"Default: do nothing cz this is the reposnsability of subclasses; sometimes nothing to be done; but this is not the case of TypeScript."
]

{ #category : 'as yet unclassified' }
TSLibraries >> beforeGenerateTreeSitterLibrary [
	"Default: do nothing cz this is the reposnsability of subclasses; sometimes nothing to be done; but this is not the case of TypeScript."
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

{ #category : 'accessing' }
TSLibraries >> commandLine [

	^ TSLibrariesCommandLines treeSitter 
]

{ #category : 'as yet unclassified' }
TSLibraries >> ensureTreeSitterLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitter;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
]

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterLibrary [

	| command status |
	self beforeGenerateTreeSitterLibrary.

	command := self platformCommandFor: self commandLine.

	self logInTranscript:
		'Start generating Tree Sitter ' , self languageName , ' library'.

	status := LibC uniqueInstance system: command.

	self logInTranscript: 'Tree Sitter ' , self languageName
		, ' library generation command is finished'.

	self afterGenerateTreeSitterLibrary.

	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter ' , self languageName
				, ' library generated successfully' ]
		ifFalse: [
			Error signal: 'Tree Sitter ' , self languageName
				, ' library was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibraries >> gitCloneCommandFor: repositoryUrl branch: branchName destination: clonePath [ 

	branchName ifNil: [
		^ 'git clone --depth 1 ', repositoryUrl, ' ', clonePath ].
 
	^ 'git clone --branch ', branchName, ' --depth 1 ', repositoryUrl, ' ', clonePath
]

{ #category : 'testing' }
TSLibraries >> isMainTreeSitterLibrary [

	^ (self libraryName copyUpTo: $.)  = 'libtree-sitter'
]

{ #category : 'accessing' }
TSLibraries >> languageName [
	^ 'Tree Sitter'
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

	OSPlatform current isWindows
		ifTrue: [ ^ aName , '.dll' ]
		ifFalse: [
			OSPlatform current isMacOS
				ifTrue: [ ^ aName , '.dylib' ]
				ifFalse: [ ^ aName , '.so' ] ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> libraryRootInDocuments [

	OSPlatform current isWindows
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

	OSPlatform current isMacOS ifTrue: [ ^ aCmdLines cmdMac ].
	OSPlatform current isWindows ifTrue: [ ^ aCmdLines cmdWindows ].
	^ aCmdLines cmdLinux
]

{ #category : 'as yet unclassified' }
TSLibraries >> vmLibrariesDirectory [

	| dir |
	"Different for each OS"
	OSPlatform current isWindows
		ifTrue: [ dir := Smalltalk vm directory ]
		ifFalse: [
			OSPlatform current isMacOS
				ifTrue: [
				dir := Smalltalk vm directory
				       , '/Pharo.app/Contents/MacOS/Plugins' ]
				ifFalse: [ dir := Smalltalk vm directory ] ].

	^ dir asFileReference
]
