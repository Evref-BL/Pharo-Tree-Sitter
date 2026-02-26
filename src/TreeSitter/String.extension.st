Extension { #name : 'String' }

{ #category : '*TreeSitter' }
String >> positionFromTSPoint: aTSPoint [
		
    ^ self positionFromTSPoint: aTSPoint usingEncoding: #utf8
]

{ #category : '*TreeSitter' }
String >> positionFromTSPoint: aTSPoint usingEncoding: anEncoding [
	
	"This method is used to convert a TSPoint to the position in the original string"
	"It is specifically used in the TSHighliter to make it compatible with inspectionFASTSourceCode: of FASTEntity"
	
	| bytes currentRow index |
    
    bytes := self encodeWith: anEncoding. "converting cod e to bytes;"

    currentRow := 0.
    index := 1.
    
    [ currentRow < aTSPoint row ] whileTrue: [
        index > bytes size ifTrue: [
            self error: 'Row exceeds number of lines'
        ].
        
        (bytes at: index) = 10 ifTrue: [ "apparently 10 is the byte value of \n in UTF-8 (and ASCII); but this is risky if the encoding is not utf8"
            currentRow := currentRow + 1
        ].
        
        index := index + 1.
    ].
    
    (index - 1 + aTSPoint column) > bytes size ifTrue: [
        self error: 'Column exceeds line length'
    ].
    
    ^ index - 1 + aTSPoint column
]
