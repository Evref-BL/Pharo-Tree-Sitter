Class {
	#name : 'TSLibraries',
	#superclass : 'Object',
	#category : 'TreeSitter-Libraries',
	#package : 'TreeSitter-Libraries'
}

{ #category : 'as yet unclassified' }
TSLibraries >> cloneTreeSitter [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self dependenciesDirectory , '/tree-sitter'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter.git ', clonePath.

	self logInTreanscript: 'Start cloning TreeSitter in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTreanscript:
				'Tree Sitter successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTreanscript:
				'Tree Sitter clone failed with exit code: ' , status asString ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> cloneTreeSitterPython [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self dependenciesDirectory , '/tree-sitter-python'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter-python.git '
	                , clonePath.

	self logInTreanscript:
		'Start cloning Tree-Sitter-python in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTreanscript:
				'Tree Sitter Python successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTreanscript:
				'Tree Sitter Python clone failed with exit code: '
				, status asString ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> cloneTreeSitterTypescript [

	| clonePath cloneCommand status |
	"Construct clone path"
	clonePath := self dependenciesDirectory , '/tree-sitter-typescript'.

	"Execute clone command"
	cloneCommand := 'git clone https://github.com/tree-sitter/tree-sitter-typescript.git '
	                , clonePath.

	self logInTreanscript:
		'Start cloning Tree-Sitter-typescript in' , clonePath.

	"Run the command"
	status := LibC uniqueInstance system: cloneCommand.

	"Verify success"
	status = 0
		ifTrue: [
			self logInTreanscript:
				'Tree Sitter Typescript successfully cloned to: ' , clonePath ]
		ifFalse: [
			self logInTreanscript:
				'Tree Sitter Typescript clone failed with exit code: '
				, status asString ]
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdLinuxTreeSitter [

	self shouldBeImplemented.
	^ ''
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdLinuxTreeSitterPython [

	self shouldBeImplemented.
	^ ''
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdLinuxTreeSitterTypescript [

	self shouldBeImplemented.
	^ ''
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdMacTreeSitter [
	| path command |
	
	path := self dependenciesDirectory , '/tree-sitter/lib'.
	command := 'cd ' , path.
	command := command, '&& mkdir -p build'.
	command := command, '&& cd build'.
	command := command, '&& cmake -G Ninja .. -DCMAKE_OSX_ARCHITECTURES="x86_64;arm64"'.
	command := command, '&& ninja'. 
	
	^ command
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdMacTreeSitterPython [
	| path command |
	
	path := self dependenciesDirectory , '/tree-sitter-python'.
	command := 'cd ' , path.
	command := command, '&& gcc -shared -o tree-sitter-python.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdMacTreeSitterTypescript [
	| path srcPath destPath command |
	
	path := self dependenciesDirectory , '/tree-sitter-typescript/typescript'.
	
	"this is needed to move the tree-sitter folder to common, otherwise the library generation fails"
	srcPath := self dependenciesDirectory , '/tree-sitter-typescript/typescript/src/tree_sitter'.
	destPath := self dependenciesDirectory , '/tree-sitter-typescript/common'.
	command := 'cp -r "', srcPath, '"* "', destPath, '"'.
	
	command := command, '&& cd ', path.
	command := command, '&& gcc -o tree-sitter-typescript.dylib src/parser.c src/scanner.c -fPIC -dynamiclib'.
	
	^ command
	
 
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdWindowsTreeSitter [

	| path command |
	path := self dependenciesDirectory , '/tree-sitter/lib'.
	command := 'cd ' , path.
	command := command , '&& mkdir -p build'.
	command := command , '&& cd build'.
	command := command , '&& cmake -G Ninja ..'.
	command := command , '&& ninja'.

	^ command
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdWindowsTreeSitterPython [

	| path command |
	
	path := self dependenciesDirectory , '/tree-sitter/lib'.
	command := 'cd ' , path.
	command := command , '&& gcc -shared -o tree-sitter-python.dll src/parser.c src/scanner.c'.

	^ command
]

{ #category : 'as yet unclassified' }
TSLibraries >> cmdWindowsTreeSitterTypescript [

	| path srcPath destPath command |
	
	path := self dependenciesDirectory , '/tree-sitter-typescript/typescript'.
	
	"this is needed to move the tree-sitter folder to common, otherwise the library generation fails"
	srcPath := self dependenciesDirectory , '/tree-sitter-typescript/typescript/src/tree_sitter'.
	destPath := self dependenciesDirectory , '/tree-sitter-typescript/common'.
	command := 'cp -r "', srcPath, '"* "', destPath, '"'.
	
	command := command, '&& cd ', path.
	command := command, '&& gcc -shared -o tree-sitter-typescript.dll src/parser.c src/scanner.c'.
	
	^ command
	
]

{ #category : 'as yet unclassified' }
TSLibraries >> dependenciesDirectory [

	"check if this works for any OS"

	^ FileLocator documents fullName , '/tree-sitter-dependencies'
]

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterLibraries [

	| command status |

	self isMacOS
		ifTrue: [ command := self cmdMacTreeSitter ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := self cmdWindowsTreeSitter ]
				ifFalse: [ command := self cmdLinuxTreeSitter ] ].

	self logInTreanscript: 'Start generating TreeSitter library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTreanscript:
		'TreeSitter library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
		self logInTreanscript: 'TreeSitter library generated successfully' ]
		ifFalse: [
			self logInTreanscript:
				'TreeSitter library was not generated successfully' ].
	
	^ status.
]

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterPythonLibraries [

	| command status |

	self isMacOS
		ifTrue: [ command := self cmdMacTreeSitterPython ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := self cmdWindowsTreeSitterPython ]
				ifFalse: [ command := self cmdLinuxTreeSitterPython ] ].

	self logInTreanscript: 'Start generating Tree Sitter Python library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTreanscript:
		'Tree Sitter Python library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
		self logInTreanscript: 'Tree Sitter Python library generated successfully' ]
		ifFalse: [
			self logInTreanscript:
				'Tree Sitter Python library was not generated successfully' ].
	
	^ status.
]

{ #category : 'as yet unclassified' }
TSLibraries >> generateTreeSitterTypescriptLibraries [

	| command status |

	self isMacOS
		ifTrue: [ command := self cmdMacTreeSitterTypescript ]
		ifFalse: [
			self isWindows
				ifTrue: [ command := self cmdWindowsTreeSitterTypescript ]
				ifFalse: [ command := self cmdLinuxTreeSitterTypescript ] ].

	self logInTreanscript: 'Start generating Tree Sitter Typescript library'.

	"Run the command"
	status := LibC uniqueInstance system: command.

	self logInTreanscript:
		'Tree Sitter Typescript library generation command is finished'.

	"Verify success"
	status = 0
		ifTrue: [
		self logInTreanscript: 'Tree Sitter Typescript library generated successfully' ]
		ifFalse: [
			self logInTreanscript:
				'Tree Sitter Typescript library was not generated successfully' ].
	
	^ status.
]

{ #category : 'testing' }
TSLibraries >> isLinux [
	"Smalltalk os isLinux"

	^ OSPlatform current isLinux
]

{ #category : 'testing' }
TSLibraries >> isMacOS [ 

	^ OSPlatform current isMacOS
]

{ #category : 'testing' }
TSLibraries >> isWindows [

	^ OSPlatform current isWindows
]

{ #category : 'as yet unclassified' }
TSLibraries >> logInTreanscript: aMessage [

	Transcript
		show: aMessage;
		cr.

]
