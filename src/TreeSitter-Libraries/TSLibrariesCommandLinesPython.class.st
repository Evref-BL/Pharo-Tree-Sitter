Class {
	#name : 'TSLibrariesCommandLinesPython',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdLinuxTreeSitterPython [

	^ self cmdMacAndLinuxTreeSitterPython
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdMacAndLinuxTreeSitterPython [
	| path command |
	
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-python'.
	
	command := 'cd ' , path.
	command := command, ' && make'. 
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdMacTreeSitterPython [

	^ self cmdMacAndLinuxTreeSitterPython
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdWindowsTreeSitterPython [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o tree-sitter-python.dll src/parser.c src/scanner.c'.

	^ command
]
