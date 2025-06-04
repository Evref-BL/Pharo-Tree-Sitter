Class {
	#name : 'TSLibrariesCommandLinesC',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesC >> cmdLinuxTreeSitterC [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-c'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesC >> cmdMacTreeSitterC [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-c'
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
