Class {
	#name : 'TSLibrariesCommandLines',
	#superclass : 'Object',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdLinuxTreeSitter [

	^ self cmdMacAndLinuxTreeSitter
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMacAndLinuxTreeSitter [
	| path command |
	
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter'.
	command := 'cd ' , path.
	command := command, ' && make'.
	 
	^ command
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMacTreeSitter [

	^ self cmdMacAndLinuxTreeSitter
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
