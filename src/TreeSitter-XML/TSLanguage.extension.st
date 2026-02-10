Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-XML' }
TSLanguage class >> xml [
	 
	^ TSXMLLibrary uniqueInstance tree_sitter_xml
]
