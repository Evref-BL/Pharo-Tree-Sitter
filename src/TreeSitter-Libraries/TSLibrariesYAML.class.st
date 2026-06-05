Class {
	#name : 'TSLibrariesYAML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> cloneTreeSitterYAML [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-yaml'.

	"before cloning get the latest release"	
	"lastReleasedVersion := self class gitBranchToUse ifNil: [ self latestReleaseTagForOwner: 'ikatyang' repo: 'tree-sitter-yaml' ]."
	
	"Execute clone command"
	cloneCommand := 'git clone https://github.com/ikatyang/tree-sitter-yaml.git '
	                , clonePath.
	"cloneCommand := 'git clone --branch ', lastReleasedVersion ,' --depth 1 https://github.com/ikatyang/tree-sitter-yaml.git '
	                , clonePath." 

	self logInTranscript:
		'Start cloning Tree-Sitter-YAML in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter YAML successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter YAML clone failed with exit code: '
				, status asString ]
]

{ #category : 'accessing' }
TSLibrariesYAML >> commandLine [

	^ TSLibrariesCommandLines yaml
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> ensureYAMLLibraryExists [

	self libraryExists ifTrue: [ ^ self ].
	self libraryExistsInDocuments ifFalse: [
		self
			cloneTreeSitterYAML;
			generateTreeSitterLibrary ].
	self moveLibraryToPharoVM
]

{ #category : 'accessing' }
TSLibrariesYAML >> languageName [

	^ 'YAML'
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> libraryName [

	^ self libraryName: 'libtree-sitter-yaml'.
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> libraryRootInDocuments [

	^ '/tree-sitter-yaml/'
]
