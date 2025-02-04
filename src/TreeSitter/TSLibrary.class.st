Class {
	#name : 'TSLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'accessing - platform' }
TSLibrary >> macLibraryName [ 
	"Users should use unix32* or unix64*"

	^ FFIMacLibraryFinder findAnyLibrary: #( 'libtree-sitter.dylib' )
]

{ #category : 'parser' }
TSLibrary >> ts_field_count_for_language: aTSLanguage [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal  ].
	^ self ffiCall:
		  'uint32 ts_language_field_count(const TSLanguage * aTSLanguage)'
]

{ #category : 'language' }
TSLibrary >> ts_language: aTSLanguage _field_name_for_id: aFieldID [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal ].
	^ self ffiCall:
		  'char * ts_language_field_name_for_id(TSLanguage * aTSLanguage, uint16 aFieldID)'
]

{ #category : 'language' }
TSLibrary >> ts_language: aTSLanguage _symbol_name: symbol [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal ].
	^ self ffiCall:
		  'char * ts_language_symbol_name(TSLanguage *  aTSLanguage, uint16 symbol)'
]

{ #category : 'language' }
TSLibrary >> ts_language: aTSLanguage _symbol_type: symbol [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal ].
	^ self ffiCall:
		  'TSSymbolType ts_language_symbol_type(TSLanguage * aTSLanguage, uint16 symbol)'
]

{ #category : 'language' }
TSLibrary >> ts_language_field_count: aTSLanguage [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal ].
	^ self ffiCall:
		  'uint32 ts_language_field_count(TSLanguage * aTSLanguage)'
]

{ #category : 'language' }
TSLibrary >> ts_language_name: aTSLanguage [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal ].
	^ self ffiCall: 'char * ts_language_name(TSLanguage *  aTSLanguage)'
]

{ #category : 'language' }
TSLibrary >> ts_language_symbol_count: aTSLanguage [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal ].
	^ self ffiCall:
		  'uint32 ts_language_symbol_count(TSLanguage * aTSLanguage)'
]

{ #category : 'language' }
TSLibrary >> ts_language_version: aTSLanguage [

	aTSLanguage isNull ifTrue: [ TSNullPointerException signal  ].
	^ self ffiCall:
		  'uint32 ts_language_version(TSLanguage * aTSLanguage)'
]

{ #category : 'node' }
TSLibrary >> ts_node: aTsNode _field_name_for_named_child: namedChildIndex [ 

	^ self ffiCall: 'char * ts_node_field_name_for_named_child(TSNode aTsNode, uint32 namedChildIndex)'
]

{ #category : 'node' }
TSLibrary >> ts_node: aTSNode _named_child_count: child_index [

	^ self ffiCall:
		  'TSNode ts_node_named_child(TSNode aTSNode, uint32 child_index)'
]

{ #category : 'node' }
TSLibrary >> ts_node_child_count: aTSNode [

	^ self ffiCall: 'uint32 ts_node_child_count(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_child_of: aTSNode _by_field_name: aFieldName ofLength: field_name_length [ 
	
	^ self ffiCall:
		  'TSNode ts_node_child_by_field_name( TSNode aTSNode, char * aFieldName, uint32 field_name_length)'
]

{ #category : 'parser' }
TSLibrary >> ts_node_end_byte: aTSNode [

	^ self ffiCall:
		  'uint32 ts_node_end_byte(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_end_point: aTSNode [

	^ self ffiCall: 'TSPoint ts_node_end_point(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_eq: aTSNode to: otherNode [

	^ self ffiCall: 'bool ts_node_eq(TSNode aTSNode, TSNode otherNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_has_changes: aTSNode [
	
	"Check if a syntax node has been edited."
	
	^ self ffiCall: 'bool ts_node_has_changes(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_is_named: aTSNode [

	^ self ffiCall: 'bool ts_node_is_named(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_is_null: aTSNode [

	^ self ffiCall: 'bool ts_node_is_null(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_named_child_count: aTSNode [

	^ self ffiCall: 'uint32 ts_node_named_child_count(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_next_sibling: aTSNode [

	^ self ffiCall: 'TSNode ts_node_next_sibling(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_parent: aTSNode [
	
	"Get the node's immediate parent.
 	Prefer [`ts_node_child_containing_descendant`] for iterating over the node's ancestors.."
	
	^ self ffiCall: 'TSNode ts_node_parent(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_prev_sibling: aTSNode [

	^ self ffiCall: 'TSNode ts_node_prev_sibling(TSNode aTSNode)'
]

{ #category : 'parser' }
TSLibrary >> ts_node_start_byte: aTSNode [

	^ self ffiCall:
		  'uint32 ts_node_start_byte(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_start_point: aTSNode [

	^ self ffiCall: 'TSPoint ts_node_start_point(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_string: aTSNode [ 

	^ self ffiCall: 'char *ts_node_string(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_symbol: aTSNode [

	^ self ffiCall: 'uint16 ts_node_symbol(TSNode aTSNode)'
]

{ #category : 'node' }
TSLibrary >> ts_node_type: aTSNode [

	^ self ffiCall: 'const char * ts_node_type(TSNode aTSNode)'
]

{ #category : 'parser' }
TSLibrary >> ts_parser: aParser _parse_string: aString ofLength: length usingOldTree: anOldTree [
	
	"use `ExternalAddress null` if there is no old tree existing for now"
	
	^ self ffiCall:
		  'TSTree * ts_parser_parse_string ( TSParser * aParser, TSTree * anOldTree, char * aString, uint32 length )'
]

{ #category : 'parser' }
TSLibrary >> ts_parser: aTSParser _set_language: aTSLanguage [

	^ self ffiCall:
		  'bool ts_parser_set_language(TSParser * aTSParser, TSLanguage * aTSLanguage)'
]

{ #category : 'parser' }
TSLibrary >> ts_parser_delete: aTSParser [

	^ self ffiCall:
		  'void ts_parser_delete (TSParser * aTSParser )'
]

{ #category : 'parser' }
TSLibrary >> ts_parser_language: aTSParser [

	^ self ffiCall:
		  'TSLanguage * ts_parser_language (TSParser * aTSParser )'
]

{ #category : 'parser' }
TSLibrary >> ts_parser_new [

	^ self ffiCall:
		  'TSParser * ts_parser_new ()'
]

{ #category : 'parser' }
TSLibrary >> ts_parser_reset: aTSParser [

	self ffiCall: 'void ts_parser_reset(TSParser *aTSParser)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_current_field_id: aTSTreeCursor [ 

	^ self ffiCall: 'char * ts_tree_cursor_current_field_id(TSTreeCursor * aTSTreeCursor)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_current_field_name: aTSTreeCursor [ 

	^ self ffiCall: 'char * ts_tree_cursor_current_field_name(TSTreeCursor * aTSTreeCursor)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_current_node: aTSTreeCursor [ 

	^ self ffiCall: 'TSNode ts_tree_cursor_current_node(const TSTreeCursor * aTSTreeCursor) '
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_goto_first_child: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_first_child(TSTreeCursor * aTSTreeCursor)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_goto_last_child: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_last_child(TSTreeCursor * aTSTreeCursor)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_goto_next_sibling: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_next_sibling(TSTreeCursor * aTSTreeCursor)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_goto_parent: aTSTreeCursor [ 

	^ self ffiCall: 'bool ts_tree_cursor_goto_parent(TSTreeCursor * aTSTreeCursor)'
]

{ #category : 'cursor' }
TSLibrary >> ts_tree_cursor_new: aTSNode [

	^ self ffiCall: 'TSTreeCursor ts_tree_cursor_new (TSNode aTSNode)'
]

{ #category : 'tree' }
TSLibrary >> ts_tree_edit: aTSTree forInputEdit: aTSInputEdit [
	
	self ffiCall:
		  'void ts_tree_edit(TSTree *aTSTree, const TSInputEdit *aTSInputEdit)'
]

{ #category : 'tree' }
TSLibrary >> ts_tree_root_node: aTSTree [

	^ self ffiCall: 'TSNode ts_tree_root_node(TSTree * aTSTree)'
]

{ #category : 'accessing - platform' }
TSLibrary >> unixLibraryName [
	"Users should use unix32* or unix64*"

	^ 'libtree-sitter.so'
]

{ #category : 'accessing - platform' }
TSLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary: #('libtree-sitter.dll')
]
