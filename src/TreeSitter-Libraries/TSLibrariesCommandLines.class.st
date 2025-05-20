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
TSLibrariesCommandLines >> cmdLinuxTreeSitterPython [

	self shouldBeImplemented.
	^ ''
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdLinuxTreeSitterTypescript [

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
TSLibrariesCommandLines >> cmdMacTreeSitterPython [
	| path command |
	
	path := TSLibraries new librariesDirectory , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command, '&& gcc -shared -o tree-sitter-python.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMacTreeSitterTypescript [
	| path srcPath destPath command |
	
	path := TSLibraries new librariesDirectory , '/tree-sitter-typescript/typescript'.
	
	"this is needed to move the tree-sitter folder to common, otherwise the library generation fails"
	srcPath := TSLibraries new librariesDirectory , '/tree-sitter-typescript/typescript/src/tree_sitter'.
	destPath := TSLibraries new librariesDirectory , '/tree-sitter-typescript/common'.
	command := 'cp -r "', srcPath, '"* "', destPath, '"'.
	
	command := command, '&& cd ', path.
	command := command, '&& gcc -o tree-sitter-typescript.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
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

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdWindowsTreeSitterPython [

	| path command |
	path := TSLibraries new librariesDirectory , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o tree-sitter-python.dll src/parser.c src/scanner.c'.

	^ command
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdWindowsTreeSitterTypescript [

	| path command |
	path := TSLibraries new librariesDirectory
	        , '/tree-sitter-typescript/typescript'.

	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o tree-sitter-typescript.dll src/parser.c src/scanner.c'.

	^ command
]
