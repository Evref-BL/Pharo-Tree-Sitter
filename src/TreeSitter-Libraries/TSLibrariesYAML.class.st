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

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> ensureYAMLLibraryExists [

	self libraryExists ifFalse: [
		self libraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterYAML;
				generateTreeSitterYAMLLibraries ].
		self moveLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> generateTreeSitterYAMLLibraries [

	| command status  |
	
	command := self platformCommandFor: TSLibrariesCommandLines yaml.

	self logInTranscript: 'Start generating Tree Sitter YAML library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTranscript:
		'Tree Sitter YAML library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter YAML library generated successfully' ]
		ifFalse: [
			Error signal:
				'Tree Sitter YAML library was not generated successfully' ].

	status := 0.

	^ status
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> libraryName [

	^ self libraryName: 'libtree-sitter-yaml'.
]

{ #category : 'as yet unclassified' }
TSLibrariesYAML >> libraryRootInDocuments [

	^ '/tree-sitter-yaml/'
]
