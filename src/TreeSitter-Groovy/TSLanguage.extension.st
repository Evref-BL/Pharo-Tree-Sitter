Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Groovy' }
TSLanguage class >> groovy [

	^ TSGroovyLibrary uniqueInstance tree_sitter_groovy 
]
