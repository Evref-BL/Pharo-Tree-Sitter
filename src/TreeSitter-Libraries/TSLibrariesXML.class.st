Class {
	#name : 'TSLibrariesXML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesXML >> cloneTreeSitterXML [

	| clonePath cloneCommand status lastReleasedVersion|
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-xml'.

	"before cloning get the latest release"	
	lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'tree-sitter-grammars' repo: 'tree-sitter-xml' ].

	"Execute clone command"
	cloneCommand := self
		gitCloneCommandFor: 'https://github.com/tree-sitter-grammars/tree-sitter-xml.git'
		branch: lastReleasedVersion
		destination: clonePath.

	self logInTranscript:
		'Start cloning Tree-Sitter-XML in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter XML successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter XML clone failed with exit code: '
				, status asString ]
]

{ #category : 'accessing' }
TSLibrariesXML >> commandLine [

	^ TSLibrariesCommandLines  xml
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> ensureXMLLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterXML;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
]

{ #category : 'accessing' }
TSLibrariesXML >> languageName [

	^ 'XML'
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> libraryName [

	^ self libraryName: 'libtree-sitter-xml'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> libraryRootInDocuments [

	^ '/tree-sitter-xml/xml/'
]
