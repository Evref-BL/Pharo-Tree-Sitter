Class {
	#name : 'TSLibraries',
	#superclass : 'Object',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'hooks' }
TSLibraries >> afterGenerateTreeSitterLibrary [
	"Default: do nothing cz this is the reposnsability of subclasses; sometimes nothing to be done; but this is not the case of TypeScript."
]

{ #category : 'hooks' }
TSLibraries >> beforeGenerateTreeSitterLibrary [
	"Default: do nothing cz this is the reposnsability of subclasses; sometimes nothing to be done; but this is not the case of TypeScript."
]

{ #category : 'accessing' }
TSLibraries >> branchToClone [
	"In case a project want to load another version than the latest release, we let the user fill this global variable before loading this project. If the variable is not here or the language inside is not here, ignore and fallback to the latest release."

	self class environment at: #TreeSitterLibraryBranchMap ifPresent: [ :global | global at: self languageName ifPresent: [ :name | ^ name ] ].

	^ self latestReleaseTagForOwner: self repositoryOwner repo: self repositoryName
]

{ #category : 'running' }
TSLibraries >> cloneLibrary [

	| clonePath cloneCommand status |
	"Construct clone path (repositoryName is also the local folder name)"
	clonePath := self originalLibrariesDirectory , '/'
	             , self repositoryName.

	"branch may be nil like Yaml, so here it checks from where it has to clone"
	cloneCommand := self
		                gitCloneCommandFor: self repositoryUrl
		                branch: self branchToClone
		                destination: clonePath.

	self logInTranscript:
		'Start cloning Tree Sitter ' , self languageName , ' in '
		, clonePath.

	status := LibC uniqueInstance system: cloneCommand.

	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter ' , self languageName , ' successfully cloned to: '
				, clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter ' , self languageName
				, ' clone failed with exit code: ' , status asString ].

	^ status
]

{ #category : 'accessing' }
TSLibraries >> commandLine [

	^ TSLibrariesCommandLines treeSitter 
]

{ #category : 'running' }
TSLibraries >> ensureTreeSitterLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneLibrary ;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
]

{ #category : 'running' }
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

{ #category : 'accessing' }
TSLibraries >> gitCloneCommandFor: repositoryUrl branch: branchName destination: clonePath [

	branchName ifNil: [ ^ 'git clone --depth 1 ' , repositoryUrl , ' ' , clonePath ].

	^ 'git clone --branch ' , branchName , ' --depth 1 ' , repositoryUrl , ' ' , clonePath
]

{ #category : 'testing' }
TSLibraries >> isMainTreeSitterLibrary [

	^ (self libraryName copyUpTo: $.)  = 'libtree-sitter'
]

{ #category : 'accessing' }
TSLibraries >> languageName [
	^ 'Tree Sitter'
]

{ #category : 'accessing' }
TSLibraries >> latestReleaseTagForOwner: owner repo: repoName [
	"I am a method that uses github apis to get the latest release version of a repo based on its name and its owner. If HTTPS is not available in the current VM, answer nil so callers can fall back to a plain git clone."

	| url json client body status |
	url := 'https://api.github.com/repos/' , owner , '/' , repoName , '/releases/latest'.

	client := ZnClient new.

	^ [
		  client beOneShot.
		  client url: url.

		  body := client get.
		  status := client response status.

		  status = 200 ifFalse: [ self error: 'Cannot fetch latest release for ' , repoName ].

		  json := NeoJSONReader fromString: body.
		  json at: 'tag_name' ] ensure: [ client close ]
]

{ #category : 'testing' }
TSLibraries >> libraryExists [

	^ (self vmLibrariesDirectory / self libraryName) asFileReference exists
]

{ #category : 'testing' }
TSLibraries >> libraryExistsInDocuments [

	^ ((self originalLibrariesDirectory , self libraryRootInDocuments) asFileReference / self libraryName) exists
]

{ #category : 'accessing' }
TSLibraries >> libraryName [

	^ self libraryName: 'libtree-sitter'.
]

{ #category : 'accessing' }
TSLibraries >> libraryName: aName [

	^ aName , (OSPlatform current isWindows
		   ifTrue: [ '.dll' ]
		   ifFalse: [
				   OSPlatform current isMacOS
					   ifTrue: [ '.dylib' ]
					   ifFalse: [ '.so' ] ])
]

{ #category : 'accessing' }
TSLibraries >> libraryRootInDocuments [

	^ OSPlatform current isWindows
		  ifTrue: [ '\tree-sitter\build\' ]
		  ifFalse: [ '/tree-sitter/' ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> logInTranscript: aMessage [

	Transcript
		show: aMessage;
		cr
]

{ #category : 'running' }
TSLibraries >> moveLibrary: aLibraryName from: initialLocation [

	| source target |
	source := (self originalLibrariesDirectory , initialLocation , aLibraryName) asFileReference.
	target := self vmLibrariesDirectory / aLibraryName.
	source copyTo: target
]

{ #category : 'running' }
TSLibraries >> moveLibraryToPharoVM [

	self moveLibrary: self libraryName from: self libraryRootInDocuments
]

{ #category : 'accessing' }
TSLibraries >> originalLibrariesDirectory [
	"check if this works for any OS"

	^ FileLocator documents fullName , '/tree-sitter-libraries'
]

{ #category : 'accessing' }
TSLibraries >> platformCommandFor: aCmdLines [

	OSPlatform current isMacOS ifTrue: [ ^ aCmdLines cmdMac ].
	OSPlatform current isWindows ifTrue: [ ^ aCmdLines cmdWindows ].
	^ aCmdLines cmdLinux
]

{ #category : 'accessing' }
TSLibraries >> repositoryName [
	^ 'tree-sitter'
]

{ #category : 'accessing' }
TSLibraries >> repositoryOwner [
	^ 'tree-sitter'
]

{ #category : 'accessing' }
TSLibraries >> repositoryUrl [

	^ 'https://github.com/' , 
		self repositoryOwner , 
		'/', 
		self repositoryName , 
		'.git'
]

{ #category : 'accessing' }
TSLibraries >> vmLibrariesDirectory [
	"Different for each OS"

	^ (OSPlatform current isWindows
		   ifTrue: [ Smalltalk vm directory ]
		   ifFalse: [
				   OSPlatform current isMacOS
					   ifTrue: [ Smalltalk vm directory , '/Pharo.app/Contents/MacOS/Plugins' ]
					   ifFalse: [ Smalltalk vm directory ] ]) asFileReference
]
