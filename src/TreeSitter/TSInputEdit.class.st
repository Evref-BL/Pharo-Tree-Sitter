Class {
	#name : 'TSInputEdit',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_NEWENDBYTE',
		'OFFSET_NEWENDPOINT',
		'OFFSET_OLDENDBYTE',
		'OFFSET_OLDENDPOINT',
		'OFFSET_STARTBYTE',
		'OFFSET_STARTPOINT'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'as yet unclassified' }
TSInputEdit class >> fieldsDesc [  
	^ #(
		uint32 startByte;
		uint32 oldEndByte;
		uint32 newEndByte;
		TSPoint startPoint;
		TSPoint oldEndPoint;
		TSPoint newEndPoint;
	)
 
]

{ #category : 'as yet unclassified' }
TSInputEdit >> createPointWithRow: aRow andColumn: aColumn [
	
	| newPoint |
	
	newPoint := TSPoint new.
	^  newPoint
			row: aRow;
			column: aColumn. 
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> newEndByte [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_NEWENDBYTE
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> newEndByte: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NEWENDBYTE put: anObject
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> newEndPoint [
	"This method was automatically generated"
	^ TSPoint fromHandle: (handle referenceStructAt: OFFSET_NEWENDPOINT length: TSPoint byteSize)
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> newEndPoint: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_NEWENDPOINT put: anObject getHandle length: TSPoint byteSize
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> oldEndByte [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_OLDENDBYTE
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> oldEndByte: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_OLDENDBYTE put: anObject
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> oldEndPoint [
	"This method was automatically generated"
	^ TSPoint fromHandle: (handle referenceStructAt: OFFSET_OLDENDPOINT length: TSPoint byteSize)
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> oldEndPoint: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_OLDENDPOINT put: anObject getHandle length: TSPoint byteSize
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> startByte [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STARTBYTE
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> startByte: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STARTBYTE put: anObject
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> startPoint [
	"This method was automatically generated"
	^ TSPoint fromHandle: (handle referenceStructAt: OFFSET_STARTPOINT length: TSPoint byteSize)
]

{ #category : 'accessing - structure variables' }
TSInputEdit >> startPoint: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_STARTPOINT put: anObject getHandle length: TSPoint byteSize
]
