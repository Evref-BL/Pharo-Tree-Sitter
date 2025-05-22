Class {
	#name : 'TSLibraries',
	#superclass : 'Object',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibraries >> cloneTreeSitter [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter.git '
	                , clonePath.

	self logInTranscript: 'Start cloning TreeSitter in' , clonePath.

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
		self cloneTreeSitter; 
			generateTreeSitterLibraries; 
			moveLibraryToPharoVM.
		].
	
	
	
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
			self logInTranscript:
				'TreeSitter library was not generated successfully' ].

	^ status
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
TSLibraries >> isWindows [

	^ OSPlatform current isWindows
]

{ #category : 'as yet unclassified' }
TSLibraries >> libraryExists [

	^ (self vmLibrariesDirectory / self libraryName)
		  asFileReference exists
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

	self moveLibrary: self libraryName from: '/tree-sitter/lib/build/'
]

{ #category : 'as yet unclassified' }
TSLibraries >> originalLibrariesDirectory [
	"check if this works for any OS"

	^ FileLocator documents fullName , '/tree-sitter-libraries'
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
