Class {
	#name : 'TSLibrariesCommandLinesTypescript',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesTypescript >> cmdLinuxTreeSitterTypescript [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-typescript'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesTypescript >> cmdMacTreeSitterTypescript [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-typescript'
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
