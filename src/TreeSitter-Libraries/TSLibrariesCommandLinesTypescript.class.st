Class {
	#name : 'TSLibrariesCommandLinesTypescript',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesTypescript >> cmdLinuxTreeSitterTypescript [

	| path command |
	path := TSLibraries new originalLibrariesDirectory
	        , '/tree-sitter-typescript/typescript'.

	command := 'cd ' , path.
	command := command
	           ,
	           ' && gcc -fPIC -shared -o tree-sitter-typescript.so src/parser.c src/scanner.c'.

	^ command

]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesTypescript >> cmdMacTreeSitterTypescript [
	| path srcPath destPath command |
	
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-typescript/typescript'.
	
	"this is needed to move the tree-sitter folder to common, otherwise the library generation fails"
	srcPath := TSLibraries new originalLibrariesDirectory , '/tree-sitter-typescript/typescript/src/tree_sitter'.
	destPath := TSLibraries new originalLibrariesDirectory , '/tree-sitter-typescript/common'.
	command := 'cp -r "', srcPath, '"* "', destPath, '"'.
	
	command := command, '&& cd ', path.
	command := command, '&& gcc -o tree-sitter-typescript.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesTypescript >> cmdWindowsTreeSitterTypescript [

	| path command |
	path := TSLibraries new originalLibrariesDirectory
	        , '/tree-sitter-typescript/typescript'.

	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o tree-sitter-typescript.dll src/parser.c src/scanner.c'.

	^ command
]
