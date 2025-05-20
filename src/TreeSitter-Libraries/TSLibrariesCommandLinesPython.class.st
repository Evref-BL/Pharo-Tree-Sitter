Class {
	#name : 'TSLibrariesCommandLinesPython',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdLinuxTreeSitterPython [

	self shouldBeImplemented.
	^ ''
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdMacTreeSitterPython [
	| path command |
	
	path := TSLibraries new librariesDirectory , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command, '&& gcc -shared -o tree-sitter-python.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdWindowsTreeSitterPython [

	| path command |
	path := TSLibraries new librariesDirectory , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o tree-sitter-python.dll src/parser.c src/scanner.c'.

	^ command
]
