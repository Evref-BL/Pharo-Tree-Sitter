Extension { #name : 'ZnUTF8Encoder' }

{ #category : '*TreeSitter-FAST-Utils' }
ZnUTF8Encoder >> mapBytesToCharactersFor: aString [
	"I take as parameter a ByteArray and for each character I will fill a dictionary associating the index of the byte with the index of the character corresponding."

	| byteStream byteCount characterCount result |
	result := IdentityDictionary new: aString size.
	byteStream := (self encodeString: aString) readStream.
	byteCount := 0.
	characterCount := 0.
	result at: byteCount put: characterCount.

	[ byteStream atEnd ] whileFalse: [
			| firstByte byteLenght |
			firstByte := byteStream next.
			
			"In UTF8, if a byte lead by::
				- 0xxxxxxx, it means it is an ascii character on 1 byte.
				- 110xxxxx it means we have a 2 bytes character.
				- 1110xxxx it means we have a 3 bytes character.
				- 11110xxx it means we have a 4 bytes character."
			byteLenght := (firstByte bitAnd: 2r10000000) = 0
				              ifTrue: [ 1 ]
				              ifFalse: [
						              (firstByte bitAnd: 2r11100000) = 2r11000000
							              ifTrue: [ 2 ]
							              ifFalse: [
									              (firstByte bitAnd: 2r11110000) = 2r11100000
										              ifTrue: [ 3 ]
										              ifFalse: [
												              (firstByte bitAnd: 2r11111000) = 2r11110000
													              ifTrue: [ 4 ]
													              ifFalse: [ self errorIllegalLeadingByte ] ] ] ].

			byteStream skip: byteLenght - 1.
			byteCount := byteCount + byteLenght.
			characterCount := characterCount + 1.
			result at: byteCount put: characterCount ].

	^ result
]
