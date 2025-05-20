Class {
	#name : 'TSLibrariesTypescript',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> cloneTreeSitterTypescript [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-typescript'.

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
TSLibrariesTypescript >> copyFoldersInTreeSitterTypescript [

	| source target destination |
	source := (self originalLibrariesDirectory
	           , '/tree-sitter-typescript/typescript/src/tree_sitter')
		          asFileReference.

	target := (self originalLibrariesDirectory
	           , '/tree-sitter-typescript/common/') asFileReference.

	destination := target / source basename.
	destination ensureCreateDirectory.

	"Copy the the content of tree_sitter folder in the new destination in common"
	source copyAllTo: destination.
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> generateTreeSitterTypescriptLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLinesTypescript new.
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

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> moveTypescriptLibraryToPharoVM [

	self
		moveLibrary: self typescriptLibraryName
		from: '/tree-sitter-typescript/typescript/'
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> typescriptLibraryExists [

	^ (self vmLibrariesDirectory / self typescriptLibraryName )
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesTypescript >> typescriptLibraryName [

	^ self libraryName: 'tree-sitter-typescript'
]
