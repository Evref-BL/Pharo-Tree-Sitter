Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Typescript' }
TSLanguage class >> typescript [
	
	^ TSTypescriptLibrary uniqueInstance tree_sitter_typescript
]
