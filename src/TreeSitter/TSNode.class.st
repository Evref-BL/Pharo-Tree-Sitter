Class {
	#name : 'TSNode',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_CONTEXT0',
		'OFFSET_CONTEXT1',
		'OFFSET_CONTEXT2',
		'OFFSET_CONTEXT3',
		'OFFSET_ID',
		'OFFSET_TREE'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'field definition' }
TSNode class >> fieldsDesc [
	^ #(
	uint32 context0;
	uint32 context1;
	uint32 context2;
	uint32 context3;
  	void * id;
  	TSTree * tree;
	)
]

{ #category : 'api' }
TSNode >> childCount [

	^ TSLibrary uniqueInstance ts_node_child_count: self
]

{ #category : 'as yet unclassified' }
TSNode >> collectFieldNameOfNamedChild [

	| collection |
	collection := OrderedDictionary new.

	1 to: self namedChildCount do: [ :pharoIndex |
		| namedChild field |
		namedChild := self namedChildAt: pharoIndex.
		field := (self fieldNameOfChildNamedAt: pharoIndex)
			ifEmpty: [ '<unnamedChild>' ].
		collection
			at: field
			ifPresent: [ :found |
				found isCollection
					ifTrue: [ found add: namedChild ]
					ifFalse: [ collection at: field put: (OrderedCollection with: found with: namedChild) ]
				]
			ifAbsentPut: [namedChild] ].
	^ collection
]

{ #category : 'api' }
TSNode >> collectNamedChild [
	|children|
	children := OrderedCollection new.
	1 to: self namedChildCount do: [ :i |
		children add: (self namedChildAt: i).
		 ].
	^ children 
]

{ #category : 'accessing - structure variables' }
TSNode >> context0 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT0
]

{ #category : 'accessing - structure variables' }
TSNode >> context0: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT0 put: anObject
]

{ #category : 'accessing - structure variables' }
TSNode >> context1 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT1
]

{ #category : 'accessing - structure variables' }
TSNode >> context1: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT1 put: anObject
]

{ #category : 'accessing - structure variables' }
TSNode >> context2 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT2
]

{ #category : 'accessing - structure variables' }
TSNode >> context2: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT2 put: anObject
]

{ #category : 'accessing - structure variables' }
TSNode >> context3 [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_CONTEXT3
]

{ #category : 'accessing - structure variables' }
TSNode >> context3: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CONTEXT3 put: anObject
]

{ #category : 'api' }
TSNode >> cursor [

	^ TSLibrary uniqueInstance ts_tree_cursor_new: self
]

{ #category : 'as yet unclassified' }
TSNode >> detectChildWithFieldName: aFieldName [
	"ensure that this field name exist, crash otherwise"
	^ TSLibrary uniqueInstance ts_node_child_of: self _by_field_name: aFieldName ofLength: aFieldName size 
]

{ #category : 'collection' }
TSNode >> detectNamedChild: name ifNone: aConstantBlockClosure [ 

	^ self collectNamedChild detect: [ :tsNode | tsNode type = name ] ifNone: aConstantBlockClosure
]

{ #category : 'api' }
TSNode >> endByte [

	^ TSLibrary uniqueInstance ts_node_end_byte: self
]

{ #category : 'api' }
TSNode >> endPoint [

	^ TSLibrary uniqueInstance ts_node_end_point: self
]

{ #category : 'accessing' }
TSNode >> fieldName [

	^ TSLibrary uniqueInstance ts_tree_cursor_current_field_name:
		  self cursor
]

{ #category : 'accessing' }
TSNode >> fieldNameOfChildNamedAt: childIndex [
	"starting at 0"

	^ TSLibrary uniqueInstance
		  ts_node: self
		  _field_name_for_named_child: childIndex - 1
]

{ #category : 'api' }
TSNode >> firstNamedChild [

	^ TSLibrary uniqueInstance ts_node: self _named_child_count: 0
]

{ #category : 'api' }
TSNode >> hasChanges [ 

	^ TSLibrary uniqueInstance ts_node_has_changes: self
]

{ #category : 'api' }
TSNode >> hasChildren [ 

	^ self collectNamedChild isNotEmpty

]

{ #category : 'accessing - structure variables' }
TSNode >> id [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ID) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
TSNode >> id: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ID put: anObject getHandle.
]

{ #category : 'api' }
TSNode >> isEqualTo: anotherNode [

	^ TSLibrary uniqueInstance ts_node_eq: self to: anotherNode
]

{ #category : 'api' }
TSNode >> isErrorNode [

	^ self type = 'ERROR'
]

{ #category : 'api' }
TSNode >> isNamed [

	^ TSLibrary uniqueInstance ts_node_is_named: self
]

{ #category : 'api' }
TSNode >> isNull [ 

	^ TSLibrary uniqueInstance ts_node_is_null: self
]

{ #category : 'api' }
TSNode >> namedChildAt: childIndex [
	"starting at 0"

	^ TSLibrary uniqueInstance
		  ts_node: self
		  _named_child_count: childIndex - 1
]

{ #category : 'api' }
TSNode >> namedChildCount [

	^ TSLibrary uniqueInstance ts_node_named_child_count: self
]

{ #category : 'api' }
TSNode >> namedChildren [

	^ (1 to: self namedChildCount) collect: [ :idx |
		  self namedChildAt: idx ]
]

{ #category : 'accessing' }
TSNode >> nextSibling [ 
	"make sure to use it while siblings exist otherwise image crashes"
	^ TSLibrary uniqueInstance ts_node_next_sibling: self
]

{ #category : 'as yet unclassified' }
TSNode >> nodeChildByFieldName: aFieldName [
	
	
	^ TSLibrary uniqueInstance ts_node_child_of: self _by_field_name: aFieldName ofLength: aFieldName size. 
]

{ #category : 'api' }
TSNode >> parent [  

	^ TSLibrary uniqueInstance ts_node_parent: self
]

{ #category : 'accessing' }
TSNode >> previousSibling [ 
	"make sure to use it while siblings exist otherwise image crashes"
	^ TSLibrary uniqueInstance ts_node_prev_sibling: self
]

{ #category : 'printing' }
TSNode >> printOn: aStream [

	super printOn: aStream.
	self isNamed ifTrue: [ aStream << ' (' << self type << ')' ]
]

{ #category : 'api' }
TSNode >> startByte [

	^ TSLibrary uniqueInstance ts_node_start_byte: self
]

{ #category : 'api' }
TSNode >> startPoint [

	^ TSLibrary uniqueInstance ts_node_start_point: self
]

{ #category : 'api' }
TSNode >> string [   

	^ TSLibrary uniqueInstance ts_node_string: self
]

{ #category : 'api' }
TSNode >> symbol [

	^ TSLibrary uniqueInstance ts_node_symbol: self
]

{ #category : 'as yet unclassified' }
TSNode >> textFromSourceText: string [

	"^ string copyFrom: (string positionFromTSPoint: self startPoint)+1 to: (string positionFromTSPoint: self endPoint )."
	
	|encodedStr copiedArray |
	
	encodedStr := string withUnixLineEndings utf8Encoded.  
	copiedArray := encodedStr copyFrom: self startByte +1 to: self endByte.			
			
	^ copiedArray utf8Decoded.
]

{ #category : 'accessing - structure variables' }
TSNode >> tree [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TREE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
TSNode >> tree: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TREE put: anObject getHandle.
]

{ #category : 'api' }
TSNode >> type [

	^ TSLibrary uniqueInstance ts_node_type: self
]
