Class {
	#name : 'TSLibrariesPython',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesPython >> cloneTreeSitterPython [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-python'.

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
TSLibrariesPython >> ensurePythonLibraryExists [

	self pythonLibraryExists ifFalse: [
		self pythonLibraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterPython ;
				generateTreeSitterPythonLibraries ].
		self movePythonLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> generateTreeSitterPythonLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLinesPython new.
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
			Error signal:
				'Tree Sitter Python library was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> movePythonLibraryToPharoVM [

	self moveLibrary: self pythonLibraryName from: '/tree-sitter-python/'

]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> pythonLibraryExists [

	^ (self vmLibrariesDirectory / self pythonLibraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> pythonLibraryExistsInDocuments [

	^ (self originalLibrariesDirectory asFileReference / self pythonLibraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> pythonLibraryName [

	^ self libraryName: 'libtree-sitter-python'.

	 
]
