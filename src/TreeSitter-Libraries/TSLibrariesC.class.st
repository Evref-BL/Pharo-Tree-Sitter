Class {
	#name : 'TSLibrariesC',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesC >> cLibraryExists [

	^ (self vmLibrariesDirectory / self cLibraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> cLibraryExistsInDocuments [

	^ (self originalLibrariesDirectory asFileReference / self cLibraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> cLibraryName [

	^ self libraryName: 'tree-sitter-c'.

	 
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> cloneTreeSitterC [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-c'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter-c.git '
	                , clonePath.

	self logInTranscript:
		'Start cloning Tree-Sitter-c in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTranscript:
				'Tree Sitter C successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTranscript:
				'Tree Sitter C clone failed with exit code: '
				, status asString ]
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> ensureCLibraryExists [

	self cLibraryExists ifFalse: [
		self cLibraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterC ;
				generateTreeSitterCLibraries ].
		self moveCLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesC >> moveCLibraryToPharoVM [

	self moveLibrary: self cLibraryName from: '/tree-sitter-c/'

]
