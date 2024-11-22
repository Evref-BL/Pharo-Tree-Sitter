Class {
	#name : #TSTreeCursor,
	#superclass : #FFIStructure,
	#classVars : [
		'OFFSET_CONTEXT0',
		'OFFSET_CONTEXT1',
		'OFFSET_CONTEXT2',
		'OFFSET_ID',
		'OFFSET_TREE'
	],
	#category : #TreeSitter
}

{ #category : #'field definition' }
TSTreeCursor class >> fieldsDesc [
	^ #(
  TSTree *tree;
  void *id;
  uint32 context0;
  uint32 context1;
  uint32 context2;
	)
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> context0 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT0
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> context0: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT0 put: anObject
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> context1 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT1
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> context1: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT1 put: anObject
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> context2 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT2
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> context2: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT2 put: anObject
]

{ #category : #'as yet unclassified' }
TSTreeCursor >> currentFieldId [
	^ TSLibrary uniqueInstance ts_tree_cursor_current_field_id: self. 
]

{ #category : #accessing }
TSTreeCursor >> currentFieldName [

	^ TSLibrary uniqueInstance ts_tree_cursor_current_field_name: self
]

{ #category : #accessing }
TSTreeCursor >> currentNode [

	^ TSLibrary uniqueInstance ts_tree_cursor_current_node: self
]

{ #category : #accessing }
TSTreeCursor >> firstChild [

	^ TSLibrary uniqueInstance ts_tree_cursor_goto_first_child: self
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> id [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ID) type: ExternalType void asPointerType
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> id: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ID put: anObject getHandle.
]

{ #category : #accessing }
TSTreeCursor >> nextSibling [
	^ TSLibrary uniqueInstance ts_tree_cursor_goto_next_sibling:  self. 
]

{ #category : #accessing }
TSTreeCursor >> parent [
	^ TSLibrary uniqueInstance ts_tree_cursor_goto_parent: self. 
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> tree [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TREE) type: ExternalType void asPointerType
]

{ #category : #'accessing - structure variables' }
TSTreeCursor >> tree: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TREE put: anObject getHandle.
]
