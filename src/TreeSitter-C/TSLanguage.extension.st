Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-C' }
TSLanguage class >> cLang [
	 
	^ TSCLibrary uniqueInstance tree_sitter_c
]
