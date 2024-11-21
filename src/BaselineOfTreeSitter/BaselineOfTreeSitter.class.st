Class {
	#name : #BaselineOfTreeSitter,
	#superclass : #BaselineOf,
	#category : #BaselineOfTreeSitter
}

{ #category : #baselines }
BaselineOfTreeSitter >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfTreeSitter >> defineDependencies: spec [

	
]

{ #category : #baselines }
BaselineOfTreeSitter >> defineGroups: spec [

	
]

{ #category : #baselines }
BaselineOfTreeSitter >> definePackages: spec [

	spec
		package: 'TreeSitter';
		package: 'TreeSitter-Tests'
		with: [ spec requires: #( 'TreeSitter' 'TreeSitter-Python' 'TreeSitter-Groovy' ) ];
		package: 'TreeSitter-Groovy'
		with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Python'
		with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Spec'
		with: [ spec requires: #( 'TreeSitter' ) ]
]
