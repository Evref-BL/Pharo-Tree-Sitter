"
I return a position is a source via a line number and column number. 

Be careful! The position is in number of Bytes and not in number of characters!
"
Class {
	#name : 'TSPoint',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_COLUMN',
		'OFFSET_ROW'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'field definition' }
TSPoint class >> fieldsDesc [
	^ #(
	  	uint32 row;
  		uint32 column;
	)
]

{ #category : 'accessing - structure variables' }
TSPoint >> column [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_COLUMN
]

{ #category : 'accessing - structure variables' }
TSPoint >> column: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_COLUMN put: anObject
]

{ #category : 'accessing - structure variables' }
TSPoint >> row [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_ROW
]

{ #category : 'accessing - structure variables' }
TSPoint >> row: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ROW put: anObject
]
