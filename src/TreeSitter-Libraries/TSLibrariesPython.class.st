Class {
	#name : 'TSLibrariesPython',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesPython >> cloneTreeSitterPython [

	| clonePath cloneCommand status lastReleasedVersion|
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-python'.

	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter' repo: 'tree-sitter-python' ].

	"Execute clone command"
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter/tree-sitter-python.git'
		branch: lastReleasedVersion
		destination: clonePath.

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

	
	self libraryExists ifFalse: [
		self libraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterPython;
				generateTreeSitterPythonLibraries ].
		self moveLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> generateTreeSitterPythonLibraries [

	| command status |
	command := self platformCommandFor: TSLibrariesCommandLines python.

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
TSLibrariesPython >> libraryName [

	^ self libraryName: 'libtree-sitter-python'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> libraryRootInDocuments [

	^ '/tree-sitter-python/'
]
