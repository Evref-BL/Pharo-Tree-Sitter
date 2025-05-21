Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Typescript' }
TSLanguage class >> typescript [

	"TSLibrariesTypescript new ensureTypescriptLibraryExists."
	
	^ TSTypescriptLibrary uniqueInstance tree_sitter_typescript 
]
