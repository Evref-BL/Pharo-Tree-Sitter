"
I test how a TSFASTContextEntry matches the field of its tree-sitter node with the properties of a FAST entity.
"
Class {
	#name : 'TSFASTContextEntryTest',
	#superclass : 'TestCase',
	#category : 'TreeSitter-FAST-Utils-Tests',
	#package : 'TreeSitter-FAST-Utils-Tests'
}

{ #category : 'tests' }
TSFASTContextEntryTest >> testNodeWithoutFieldDoesNotMatchTheAliasOfUnnamedFields [

	| entry |
	entry := TSFASTContextEntry new
		         aliasUnnamedFieldAs: 'pattern';
		         yourself.
	self deny: (entry fieldMatchesProperty: (FMProperty new
				  name: #pattern;
				  yourself))
]

{ #category : 'tests' }
TSFASTContextEntryTest >> testUnnamedChildMatchesChildrenNodesWithoutAlias [

	| entry |
	entry := TSFASTContextEntry new
		         field: '<unnamedChild>';
		         yourself.
	self assert: (entry fieldMatchesProperty: (FMProperty new
				  name: #childrenNodes;
				  yourself)).
	self deny: (entry fieldMatchesProperty: (FMProperty new
				  name: #statements;
				  yourself))
]

{ #category : 'tests' }
TSFASTContextEntryTest >> testUnnamedChildMatchesTheAliasOfUnnamedFields [

	| entry |
	entry := TSFASTContextEntry new
		         field: '<unnamedChild>';
		         aliasUnnamedFieldAs: 'statements';
		         yourself.
	self assert: (entry fieldMatchesProperty: (FMProperty new
				  name: #statements;
				  yourself)).
	self deny: (entry fieldMatchesProperty: (FMProperty new
				  name: #expression;
				  yourself))
]
