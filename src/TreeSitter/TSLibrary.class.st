Class {
	#name : #TSLibrary,
	#superclass : #FFILibrary,
	#category : #TreeSitter
}

{ #category : #'accessing - platform' }
TSLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter.dylib' )
]

{ #category : #language }
TSLibrary >> ts_language_version: aTSLanguage [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal  ].
	^ self ffiCall:
		  'uint32 ts_language_version(TSLanguage * aTSLanguage)'
]

{ #category : #node }
TSLibrary >> ts_node: aTSNode _named_child_count: child_index [

	^ self ffiCall:
		  'TSNode ts_node_named_child(TSNode aTSNode, uint32 child_index)'
]

{ #category : #node }
TSLibrary >> ts_node_child_count: aTSNode [

	^ self ffiCall: 'uint32 ts_node_child_count(TSNode aTSNode)'
]

{ #category : #node }
TSLibrary >> ts_node_end_point: aTSNode [

	^ self ffiCall: 'TSPoint ts_node_end_point(TSNode aTSNode)'
]

{ #category : #node }
TSLibrary >> ts_node_is_named: aTSNode [

	^ self ffiCall: 'bool ts_node_is_named(TSNode aTSNode)'
]

{ #category : #node }
TSLibrary >> ts_node_named_child_count: aTSNode [

	^ self ffiCall: 'uint32 ts_node_named_child_count(TSNode aTSNode)'
]

{ #category : #node }
TSLibrary >> ts_node_start_point: aTSNode [

	^ self ffiCall: 'TSPoint ts_node_start_point(TSNode aTSNode)'
]

{ #category : #node }
TSLibrary >> ts_node_symbol: aTSNode [

	^ self ffiCall: 'uint16 ts_node_symbol(TSNode aTSNode)'
]

{ #category : #node }
TSLibrary >> ts_node_type: aTSNode [

	^ self ffiCall: 'const char * ts_node_type(TSNode aTSNode)'
]

{ #category : #parser }
TSLibrary >> ts_parser: aParser _parse_string: aString ofLength: length usingOldTree: anOldTree [
	
	"use `ExternalAddress null` if there is no old tree existing for now"
	
	^ self ffiCall:
		  'TSTree * ts_parser_parse_string ( TSParser * aParser, TSTree * anOldTree, char * aString, uint32 length )'
]

{ #category : #parser }
TSLibrary >> ts_parser: aTSParser _set_language: aTSLanguage [

	^ self ffiCall:
		  'bool ts_parser_set_language(TSParser * aTSParser, TSLanguage * aTSLanguage)'
]

{ #category : #parser }
TSLibrary >> ts_parser_delete: aTSParser [

	^ self ffiCall:
		  'void ts_parser_delete (TSParser * aTSParser )'
]

{ #category : #parser }
TSLibrary >> ts_parser_language: aTSParser [

	^ self ffiCall:
		  'TSLanguage * ts_parser_language (TSParser * aTSParser )'
]

{ #category : #parser }
TSLibrary >> ts_parser_new [

	^ self ffiCall:
		  'TSParser * ts_parser_new ()'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_current_field_id: aTSTreeCursor [ 

	^ self ffiCall: 'char * ts_tree_cursor_current_field_id(TSTreeCursor * aTSTreeCursor)'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_current_field_name: aTSTreeCursor [ 

	^ self ffiCall: 'char * ts_tree_cursor_current_field_name(TSTreeCursor * aTSTreeCursor)'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_current_node: aTSTreeCursor [ 

	^ self ffiCall: 'TSNode ts_tree_cursor_current_node(const TSTreeCursor * aTSTreeCursor) '
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_goto_first_child: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_first_child(TSTreeCursor * aTSTreeCursor)'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_goto_last_child: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_last_child(TSTreeCursor * aTSTreeCursor)'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_goto_next_sibling: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_next_sibling(TSTreeCursor * aTSTreeCursor)'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_goto_parent: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_parent(TSTreeCursor * aTSTreeCursor)'
]

{ #category : #cursor }
TSLibrary >> ts_tree_cursor_new: aTSNode [

	^ self ffiCall: 'TSTreeCursor ts_tree_cursor_new (TSNode aTSNode)'
]

{ #category : #tree }
TSLibrary >> ts_tree_root_node: aTSTree [

	^ self ffiCall: 'TSNode ts_tree_root_node(TSTree * aTSTree)'
]

{ #category : #'accessing - platform' }
TSLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'libtree-sitter.so' )
]

{ #category : #'accessing - platform' }
TSLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('libtree-sitter.dll')
]
