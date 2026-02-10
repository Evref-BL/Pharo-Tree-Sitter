Extension { #name : 'ZnCharacterEncoder' }

{ #category : '*TreeSitter' }
ZnCharacterEncoder >> numberOfCharactersFrom: bytes [
	"Return the number of characters represented by a byte array"

	| byteStream count |
	byteStream := bytes readStream.
	count := 0.
	[ byteStream atEnd ] whileFalse: [
			count := count + 1.
			self nextCodePointFromStream: byteStream ].
	^ count
]
