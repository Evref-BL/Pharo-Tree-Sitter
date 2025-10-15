Class {
	#name : 'TSLibrariesXML',
	#superclass : 'TSLibraries',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesXML >> cloneTreeSitterXML [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self originalLibrariesDirectory , '/tree-sitter-xml'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter-grammars/tree-sitter-xml.git '
	                , clonePath.

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

{ #category : 'as yet unclassified' }
TSLibrariesXML >> ensureXMLLibraryExists [

	self xmlLibraryExists ifFalse: [
		self xmlLibraryExistsInDocuments ifFalse: [
			self
				cloneTreeSitterXML ;
				generateTreeSitterXMLLibraries ].
		self moveXMLLibraryToPharoVM ]
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> generateTreeSitterXMLLibraries [

	| command status cmdLines |
	cmdLines := TSLibrariesCommandLinesXML new.
	self isMacOS
		ifTrue: [ command := cmdLines cmdMacTreeSitterXML ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := cmdLines cmdWindowsTreeSitterXML ]
				ifFalse: [ command := cmdLines cmdLinuxTreeSitterXML ] ].

	self logInTranscript: 'Start generating Tree Sitter XML library'.

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
TSLibrariesXML >> moveXMLLibraryToPharoVM [

	self moveLibrary: self xmlLibraryName from: '/tree-sitter-xml/xml/'

]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> xmlLibraryExists [

	^ (self vmLibrariesDirectory / self xmlLibraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> xmlLibraryExistsInDocuments [

	^ (self originalLibrariesDirectory asFileReference / self xmlLibraryName)
		  asFileReference exists
]

{ #category : 'as yet unclassified' }
TSLibrariesXML >> xmlLibraryName [

	^ self libraryName: 'libtree-sitter-xml'.

	 
]
