Class {
	#name : 'TSLibrariesJava',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesJava >> cloneTreeSitterJava [

	| clonePath cloneCommand status lastReleasedVersion |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-java'.

	"before cloning get the latest release"
	lastReleasedVersion := self class gitBranchToUse ifNil: [
		                       self
			                       latestReleaseTagForOwner: 'tree-sitter'
			                       repo: 'tree-sitter-java' ].

	"Execute clone command"
	cloneCommand := self
		                gitCloneCommandFor:
		                'https://github.com/tree-sitter/tree-sitter-java.git'
		                branch: lastReleasedVersion
		                destination: clonePath.

	self logInTranscript: 'Start cloning Tree-Sitter-java in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
				self logInTranscript:
					'Tree Sitter Java successfully cloned to: ' , clonePath ]
		ifFalse: [
				self logInTranscript:
					'Tree Sitter Java clone failed with exit code: '
					, status asString ]
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> ensureJavaLibraryExists [

	self javaLibraryExists ifTrue: [ ^ self ].
	self javaLibraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterJava;
				generateTreeSitterJavaLibraries ].
	self moveJavaLibraryToPharoVM
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> generateTreeSitterJavaLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLinesJava new.
	command := self isMacOS
		           ifTrue: [ cmdLines cmdMacTreeSitterJava ]
		           ifFalse: [
				           self isWindows
					           ifTrue: [ cmdLines cmdWindowsTreeSitterJava ]
					           ifFalse: [ cmdLines cmdLinuxTreeSitterJava ] ].

	self logInTranscript: 'Start generating Tree Sitter Java library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter Java library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
				self logInTranscript:
					'Tree Sitter Java library generated successfully' ]
		ifFalse: [
				Error signal:
					'Tree Sitter Java library was not generated successfully' ].

	^ status
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> javaLibraryExists [

	^ (self vmLibrariesDirectory / self javaLibraryName) asFileReference
		  exists
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> javaLibraryExistsInDocuments [

	^ (self originalLibrariesDirectory asFileReference
	   / self javaLibraryName) asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> javaLibraryName [

	^ self libraryName: 'libtree-sitter-java'
]

{ #category : 'as yet unclassified' }
TSLibrariesJava >> moveJavaLibraryToPharoVM [

	self moveLibrary: self javaLibraryName from: '/tree-sitter-java/'
]
