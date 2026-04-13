Class {
	#name : 'TSLibrariesCommandLinesYAML',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesYAML >> cmdLinuxTreeSitterYAML [

	"^ self tsBuildCommandForMacAndLinux: '/tree-sitter-yaml'"
	
	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-yaml'.
	command := 'cd ' , path, String lf.
	command := command , String lf,
		'clang -O3 -fPIC -Isrc -c src/parser.c -o parser.o', String lf,
    	'clang++ -O3 -fPIC -Isrc -c src/scanner.cc -o scanner.o', String lf,
    	'clang++ -shared -o libtree-sitter-yaml.so parser.o scanner.o'.
	
	^ command.
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesYAML >> cmdMacTreeSitterYAML [

	"^  self tsBuildCommandForMacAndLinux: '/tree-sitter-yaml'"
	
	
	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-yaml'.
	command := 'cd ' , path, String lf.
	command := command , String lf,
	 'clang -O3 -fPIC -Isrc -c src/parser.c -o parser.o', String lf,
    'clang++ -O3 -fPIC -Isrc -c src/scanner.cc -o scanner.o', String lf,
    'clang++ -dynamiclib -o libtree-sitter-yaml.dylib parser.o scanner.o'.

	^ command.
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesYAML >> cmdWindowsTreeSitterYAML [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-yaml'.
	command := 'cd ' , path.
	"command := command
	           ,
	           '&& gcc -shared -o libtree-sitter-yaml.dll src/parser.c'."
	
	^ command := command , '&& clang -O3 -Isrc -c src/parser.c -o parser.o', String lf,
    'clang++ -O3 -Isrc -c src/scanner.cc -o scanner.o', String lf,
    'clang++ -shared -o tree-sitter-yaml.dll parser.o scanner.o'.

	^ command
]
