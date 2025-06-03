Class {
	#name : 'TSLibrariesCommandLinesC',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesC >> cmdLinuxTreeSitterPython [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-c'.
	command := 'cd ' , path.
	command := command , ' && gcc -fPIC -shared -o tree-sitter-c.so src/parser.c src/scanner.c'.

	^ command
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesC >> cmdMacTreeSitterC [
	| path command |
	
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-c'.
	command := 'cd ' , path.
	command := command, '&& gcc -shared -o tree-sitter-c.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesC >> cmdWindowsTreeSitterC [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-c'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o tree-sitter-c.dll src/parser.c src/scanner.c'.

	^ command
]
