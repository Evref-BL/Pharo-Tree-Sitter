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
