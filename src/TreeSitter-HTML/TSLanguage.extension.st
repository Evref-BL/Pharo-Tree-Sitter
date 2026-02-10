Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-HTML' }
TSLanguage class >> html [
	 
	^ TSHTMLLibrary uniqueInstance tree_sitter_html
]
