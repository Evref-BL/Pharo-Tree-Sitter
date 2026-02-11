Class {
	#name : 'TSLibrariesCommandLinesCSS',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesCSS >> cmdLinuxTreeSitterCSS [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-css'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesCSS >> cmdMacTreeSitterCSS [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-css'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesCSS >> cmdWindowsTreeSitterCSS [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter-css'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o libtree-sitter-css.dll src/parser.c'.

	^ command
]
