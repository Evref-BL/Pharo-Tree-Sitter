Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-YAML' }
TSLanguage class >> yaml [
	 
	^ TSYAMLLibrary uniqueInstance tree_sitter_yaml
]
