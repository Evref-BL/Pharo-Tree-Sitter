Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Python' }
TSLanguage class >> python [
	 
	^ TSPythonLibrary uniqueInstance tree_sitter_python
]
