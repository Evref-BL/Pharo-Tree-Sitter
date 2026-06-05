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

{ #category : 'accessing' }
TSLibrariesPython >> commandLine [

	^ TSLibrariesCommandLines python 
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> ensurePythonLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterPython;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
]

{ #category : 'accessing' }
TSLibrariesPython >> languageName [

	^ 'Python'
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> libraryName [

	^ self libraryName: 'libtree-sitter-python'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesPython >> libraryRootInDocuments [

	^ '/tree-sitter-python/'
]
