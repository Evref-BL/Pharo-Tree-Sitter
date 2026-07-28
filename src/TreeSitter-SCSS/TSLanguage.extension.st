Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-SCSS' }
TSLanguage class >> scss [
	
	^ TSSCSSLibrary uniqueInstance tree_sitter_scss
]
