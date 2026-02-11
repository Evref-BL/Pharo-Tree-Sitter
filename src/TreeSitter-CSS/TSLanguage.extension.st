Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-CSS' }
TSLanguage class >> css [
	 
	^ TSCSSLibrary uniqueInstance tree_sitter_css
]
