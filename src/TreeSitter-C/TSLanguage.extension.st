Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-C' }
TSLanguage class >> c [
	 
	^ TSCLibrary uniqueInstance tree_sitter_c
]
