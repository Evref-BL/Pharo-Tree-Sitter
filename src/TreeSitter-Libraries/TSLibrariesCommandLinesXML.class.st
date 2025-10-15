Class {
	#name : 'TSLibrariesCommandLinesXML',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesXML >> cmdLinuxTreeSitterXML [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-xml'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesXML >> cmdMacTreeSitterXML [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-xml'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesXML >> cmdWindowsTreeSitterXML [

	| path command |
	path := TSLibraries new originalLibrariesDirectory
	        , '/tree-sitter-typescript/xml'.

	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o libtree-sitter-xml.dll src/parser.c src/scanner.c'.

	^ command
]
