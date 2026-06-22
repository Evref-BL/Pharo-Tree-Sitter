Class {
	#name : 'TSLibrariesCommandLinesJava',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesJava >> cmdLinuxTreeSitterJava [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-java'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesJava >> cmdMacTreeSitterJava [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-java'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesJava >> cmdWindowsTreeSitterJava [

	| path command |
	path := TSLibraries new originalLibrariesDirectory
	        , '/tree-sitter-java'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o libtree-sitter-java.dll src/parser.c src/scanner.c'.

	^ command
]
