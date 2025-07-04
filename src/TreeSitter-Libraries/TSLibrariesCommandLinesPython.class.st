Class {
	#name : 'TSLibrariesCommandLinesPython',
	#superclass : 'TSLibrariesCommandLines',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdLinuxTreeSitterPython [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-python'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdMacTreeSitterPython [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter-python'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLinesPython >> cmdWindowsTreeSitterPython [

	| path command |
	path := TSLibraries new originalLibrariesDirectory
	        , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command
	           ,
	           '&& gcc -shared -o libtree-sitter-python.dll src/parser.c src/scanner.c'.

	^ command
]
