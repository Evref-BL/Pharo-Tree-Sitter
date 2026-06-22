Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Java' }
TSLanguage class >> java [

	^ TSJavaLibrary uniqueInstance tree_sitter_java
]
