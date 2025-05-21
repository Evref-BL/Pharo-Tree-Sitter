Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Python' }
TSLanguage class >> python [

	"TSLibrariesPython new ensurePythonLibraryExists."
	
	^ TSPythonLibrary uniqueInstance tree_sitter_python
]
