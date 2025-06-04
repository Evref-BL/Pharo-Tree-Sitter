Class {
	#name : 'TSLibrariesCommandLines',
	#superclass : 'Object',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdLinuxTreeSitter [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMacTreeSitter [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdWindowsTreeSitter [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter/lib'.
	command := 'cd ' , path.
	command := command , '&& mkdir -p build'.
	command := command , '&& cd build'.
	command := command , '&& cmake -G Ninja ..'.
	command := command , '&& ninja'.

	^ command
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> tsBuildCommandForMacAndLinux: tsFolderName [
	"Tree-Sitter and its grammars already have a Makefile that makes the library building process easy, with just the make command at the root of tree-sitter or the grammar."
	| path command |
	path := TSLibraries new originalLibrariesDirectory , tsFolderName.
	command := 'cd ' , path.
	command := command , ' && make'.

	^ command
]
