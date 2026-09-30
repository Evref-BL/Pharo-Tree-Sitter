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

{ #category : 'instance creation' }
TSInputEdit class >> fromString: oldString to: newString [  
	"Answer the edit turning oldString into newString, as a single replaced byte range.
	Offsets are in UTF-8 bytes, as parseString: sends UTF-8 to tree-sitter.
	The range is the smallest one: common prefix and common suffix are left out."

	| oldBytes newBytes prefix maxSuffix suffix oldEnd newEnd |
	oldBytes := oldString utf8Encoded.
	newBytes := newString utf8Encoded.

	prefix := 0.
	[ prefix < oldBytes size and: [
		prefix < newBytes size and: [
		(oldBytes at: prefix + 1) = (newBytes at: prefix + 1) ] ] ]
		whileTrue: [ prefix := prefix + 1 ].

	"the suffix must not overlap the prefix"
	maxSuffix := (oldBytes size min: newBytes size) - prefix.
	suffix := 0.
	[ suffix < maxSuffix and: [
		(oldBytes at: oldBytes size - suffix) = (newBytes at: newBytes size - suffix) ] ]
		whileTrue: [ suffix := suffix + 1 ].

	oldEnd := oldBytes size - suffix.
	newEnd := newBytes size - suffix.

	^ self new
		startByte: prefix;
		oldEndByte: oldEnd;
		newEndByte: newEnd;
		startPoint: (self pointAt: prefix in: oldBytes);
		oldEndPoint: (self pointAt: oldEnd in: oldBytes);
		newEndPoint: (self pointAt: newEnd in: newBytes);
		yourself 
]

{ #category : 'accessing' }
TSInputEdit class >> pointAt: aByteOffset in: aByteArray [  
	"Answer the TSPoint of a 0-based byte offset, computed like tree-sitter:
	row = number of LF bytes before it, column = number of bytes since the last LF."

	| row lineStart |
	row := 0.
	lineStart := 0.
	1 to: aByteOffset do: [ :i |
		(aByteArray at: i) = 10 ifTrue: [
			row := row + 1.
			lineStart := i ] ].
	^ TSPoint new
		row: row;
		column: aByteOffset - lineStart;
		yourself

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
