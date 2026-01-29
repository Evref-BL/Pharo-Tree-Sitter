Class {
	#name : 'TSLibrariesCommandLinesHTML',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesHTML >> cmdLinuxTreeSitterHTML [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-html'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesHTML >> cmdMacTreeSitterHTML [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-html'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesHTML >> cmdWindowsTreeSitterHTML [

	| path command |
	path := TSLibraries new originalLibrariesDirectory
	        , '/tree-sitter-typescript/html'.

	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o libtree-sitter-html.dll src/parser.c src/scanner.c'.

	^ command
]
