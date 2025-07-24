Class {
	#name : 'BaselineOfTreeSitter',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTreeSitter',
	#package : 'BaselineOfTreeSitter'
}

{ #category : 'baselines' }
BaselineOfTreeSitter >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfTreeSitter >> defineDependencies: spec [

	
]

{ #category : 'baselines' }
BaselineOfTreeSitter >> defineGroups: spec [

	spec
		group: 'default'
		with:
			#( 'TreeSitter' 'TreeSitter-Tests' 'TreeSitter-Spec'
			   'TreeSitter-Highlighter' 'TreeSitter-Visitor'
			   'TreeSitter-FAST-Utils' 'TreeSitter-Libraries' ).
	spec group: 'moose' with: #( 'default' 'TreeSitter-FAST-Utils' ).
	"language"
	spec group: 'mermaid' with: #( 'default' 'TreeSitter-Mermaid' ).
	spec group: 'groovy' with: #( 'default' 'TreeSitter-Groovy' ).
	spec group: 'python' with: #( 'default' 'TreeSitter-Python' ).
	spec group: 'typescript' with: #( 'default' 'TreeSitter-Typescript' ).
	spec group: 'cLang' with: #( 'default' 'TreeSitter-C' )
]

{ #category : 'baselines' }
BaselineOfTreeSitter >> definePackages: spec [

	spec
		package: 'TreeSitter';
		package: 'TreeSitter-Tests' with: [ spec requires: #( 'TreeSitter' 'TreeSitter-Python' 'TreeSitter-Groovy' 'TreeSitter-Typescript' 'TreeSitter-C' ) ];
		package: 'TreeSitter-Groovy' with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Python' with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Typescript' with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-C' with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Spec' with: [ spec requires: #( 'TreeSitter-Visitor' ) ];
		package: 'TreeSitter-Visitor' with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Libraries' with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Highlighter' with: [ spec requires: #( 'TreeSitter' ) ].

	"Moose integration for reyfication"
	spec package: 'TreeSitter-FAST-Utils' with: [ spec requires: #( 'TreeSitter-Visitor' ) ]
]
