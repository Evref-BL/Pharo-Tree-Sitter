Class {
	#name : 'TSLibrariesCommandLines',
	#superclass : 'Object',
	#instVars : [
		'folderName',
		'windowsLibName',
		'sources',
		'usesScanner',
		'customBuilder'
	],
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'local' }
TSLibrariesCommandLines class >> c [

	^ self new
		  folderName: 'tree-sitter-c';
		  windowsLibName: 'libtree-sitter-c.dll';
		  sources: #( 'src/parser.c' );
		  yourself
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines class >> css [    ^ self new        folderName: 'tree-sitter-css';        windowsLibName: 'libtree-sitter-css.dll';        sources: #('src/parser.c');        yourself
]

{ #category : 'accessing' }
TSLibrariesCommandLines class >> html [

	^ self new
		  folderName: 'tree-sitter-html';
		  windowsLibName: 'libtree-sitter-html.dll';
		  sources: #( 'src/parser.c' 'src/scanner.c' );
		  yourself
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines class >> python [    ^ self new        folderName: 'tree-sitter-python';        windowsLibName: 'libtree-sitter-python.dll';        sources: #('src/parser.c' 'src/scanner.c');        yourself
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines class >> treeSitter [    ^ self new        folderName: 'tree-sitter';        yourself
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines class >> typescript [

	^ self new
		  folderName: 'tree-sitter-typescript/typescript';
		  windowsLibName: 'libtree-sitter-typescript.dll';
		  sources: #( 'src/parser.c' 'src/scanner.c' );
		  yourself
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines class >> xml [

	^ self new
		  folderName: 'tree-sitter-xml/xml';
		  windowsLibName: 'libtree-sitter-xml.dll';
		  sources: #( 'src/parser.c' 'src/scanner.c' );
		  yourself
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines class >> yaml [

	^ self new
		  folderName: 'tree-sitter-yaml';
		  customBuilder: [ :builder :aPlatform | builder buildYamlFor: aPlatform ];
		  yourself
]

{ #category : 'defaults' }
TSLibrariesCommandLines >> basePath [    
	^ TSLibraries new originalLibrariesDirectory asFileReference
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> buildYamlFor: platform [

    | path |
    path := self fullPath pathString.

    ^ String streamContents: [ :s |
        s
            nextPutAll: 'cd ';
            nextPutAll: path.

        platform = #mac
            ifTrue: [
                s
                    nextPutAll: ' && clang -O3 -fPIC -Isrc -c src/parser.c -o parser.o';
                    nextPutAll: ' && clang++ -O3 -fPIC -Isrc -c src/scanner.cc -o scanner.o';
                    nextPutAll: ' && clang++ -dynamiclib -o libtree-sitter-yaml.dylib parser.o scanner.o'
            ]
            ifFalse: [
                  platform = #linux
                    ifTrue: [
                        s
                            nextPutAll: ' && clang -O3 -fPIC -Isrc -c src/parser.c -o parser.o'; cr;
                            nextPutAll: ' && clang++ -O3 -fPIC -Isrc -c src/scanner.cc -o scanner.o'; cr;
                            nextPutAll: ' && clang++ -shared -o libtree-sitter-yaml.so parser.o scanner.o'
                    ]
                    ifFalse: [
                        s
                            nextPutAll: ' && clang -O3 -Isrc -c src/parser.c -o parser.o'; cr;
                            nextPutAll: ' && clang++ -O3 -Isrc -c src/scanner.cc -o scanner.o'; cr;
                            nextPutAll: ' && clang++ -shared -o tree-sitter-yaml.dll parser.o scanner.o'
                    ]
            ]
    ]. 
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdLinux [

	^ self hasCustomBuilder
		  ifTrue: [ self customBuilder value: self value: #linux ]
		  ifFalse: [ self makeCommand ]
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdLinuxTreeSitter [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMac [

	^ self hasCustomBuilder
		  ifTrue: [ self customBuilder value: self value: #mac ]
		  ifFalse: [ self makeCommand ]
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdMacTreeSitter [

	^ self tsBuildCommandForMacAndLinux: '/tree-sitter'
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdWindows [

	^ self hasCustomBuilder
		  ifTrue: [ self customBuilder value: self value: #windows ]
		  ifFalse: [ self windowsGccCommand ]
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> cmdWindowsTreeSitter [

	| path command |
	path := TSLibraries new originalLibrariesDirectory , '/tree-sitter'.
	command := 'cd ' , path.
	command := command , ' && mkdir build'.
	command := command , ' && cd build'.
	command := command , ' && cmake -G Ninja ..'.
	command := command , ' && ninja'.

	^ command
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> customBuilder [

	^ customBuilder
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> customBuilder: anObject [

	customBuilder := anObject
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> folderName: anObject [

	folderName := anObject
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> fullPath [    
	^ self basePath / folderName
]

{ #category : 'testing' }
TSLibrariesCommandLines >> hasCustomBuilder [    
	^ customBuilder notNil
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> makeCommand [

	| path |
	
	path := self fullPath pathString.
	
	^ String streamContents: [ :s |
		  s
			  nextPutAll: 'cd ';
			  nextPutAll: path;
			  nextPutAll: ' && make' ].
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> sources: anObject [

	sources := anObject
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> tsBuildCommandForMacAndLinux: tsFolderName [
	"Tree-Sitter and its grammars already have a Makefile that makes the library building process easy, with just the make command at the root of tree-sitter or the grammar."
	| path command |
	path := TSLibraries new originalLibrariesDirectory , tsFolderName.
	command := 'cd ' , path.
	command := command , ' && make'.

	^ command
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> usesScanner: anObject [

	usesScanner := anObject
]

{ #category : 'as yet unclassified' }
TSLibrariesCommandLines >> windowsGccCommand [

	| path |
	path := self fullPath pathString.
	^ String streamContents: [ :s |
		  s
			  nextPutAll: 'cd ';
			  nextPutAll: path;
			  nextPutAll: ' && gcc -shared -o ';
			  nextPutAll: windowsLibName;
			  space;
			  nextPutAll: (sources asArray joinUsing: ' ') ]
]

{ #category : 'accessing' }
TSLibrariesCommandLines >> windowsLibName: anObject [

	windowsLibName := anObject
]
