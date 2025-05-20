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
	clonePath := self librariesDirectory , '/tree-sitter'.

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
TSLibraries >> cloneTreeSitterPython [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self librariesDirectory , '/tree-sitter-python'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter-python.git '
	                , clonePath.

	self logInTranscript:
		'Start cloning Tree-Sitter-python in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter Python successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter Python clone failed with exit code: '
				, status asString ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> cloneTreeSitterTypescript [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self librariesDirectory , '/tree-sitter-typescript'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter-typescript.git '
	                , clonePath.

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

{ #category : 'copying' }
TSLibraries >> copyFoldersInTreeSitterTypescript [

	| source target destination |
	source := (self librariesDirectory
	           , '/tree-sitter-typescript/typescript/src/tree_sitter')
		          asFileReference.

	target := (self librariesDirectory
	           , '/tree-sitter-typescript/common/') asFileReference.

	destination := target / source basename.
	destination ensureCreateDirectory.

	"Copy the the content of tree_sitter folder in the new destination in common"
	source copyAllTo: destination.
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

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterPythonLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLines new.
	self isMacOS
		ifTrue: [ command := cmdLines cmdMacTreeSitterPython ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := cmdLines cmdWindowsTreeSitterPython ]
				ifFalse: [ command := cmdLines cmdLinuxTreeSitterPython ] ].

	self logInTranscript: 'Start generating Tree Sitter Python library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter Python library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter Python library generated successfully' ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter Python library was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterTypescriptLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLines new.
	"make sure to copy the tree_sitter folder in common"
	self copyFoldersInTreeSitterTypescript.

	self isMacOS
		ifTrue: [ command := cmdLines cmdMacTreeSitterTypescript ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := cmdLines cmdWindowsTreeSitterTypescript ]
				ifFalse: [ command := cmdLines cmdLinuxTreeSitterTypescript ] ].

	self logInTranscript:
		'Start generating Tree Sitter Typescript library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter Typescript library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter Typescript library generated successfully' ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter Typescript library was not generated successfully' ].

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
TSLibraries >> librariesDirectory [
	"check if this works for any OS"

	^ FileLocator documents fullName , '/tree-sitter-libraries'
]

{ #category : 'as yet unclassified' }
TSLibraries >> logInTranscript: aMessage [

	Transcript
		show: aMessage;
		cr
]
