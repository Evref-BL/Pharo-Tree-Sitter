Class {
	#name : 'TSLibrariesCommandLines',
	#superclass : 'Object',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdLinuxTreeSitter [

	self shouldBeImplemented.
	^ ''
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMacTreeSitter [
	| path command |
	
	path := TSLibraries new librariesDirectory , '/tree-sitter/lib'.
	command := 'cd ' , path.
	command := command, '&& mkdir -p build'.
	command := command, '&& cd build'.
	command := command, '&& cmake -G Ninja .. -DCMAKE_OSX_ARCHITECTURES="x86_64;arm64"'.
	command := command, '&& ninja'. 
	
	^ command
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdWindowsTreeSitter [

	| path command |
	path := TSLibraries new librariesDirectory , '/tree-sitter/lib'.
	command := 'cd ' , path.
	command := command , '&& mkdir -p build'.
	command := command , '&& cd build'.
	command := command , '&& cmake -G Ninja ..'.
	command := command , '&& ninja'.

	^ command
]
