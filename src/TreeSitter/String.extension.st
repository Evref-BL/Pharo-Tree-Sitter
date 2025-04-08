Extension { #name : 'String' }

{ #category : '*TreeSitter' }
String >> positionFromTSPoint: aTSPoint [
	"Use me to convert a TSPoint to the position in the original string"

	| sum currentLine lines |
	sum := aTSPoint column.
	currentLine := 0.
	lines := self tsLines.
	[ currentLine < aTSPoint row ] whileTrue: [
		sum := sum + (lines at: currentLine + 1) size.
		currentLine := currentLine + 1 ].
	^ sum
]

{ #category : '*TreeSitter' }
String >> tsLineIndicesDo: aBlock [
	"execute aBlock with 3 arguments for each line:
	- start index of line
	- end index of line without line delimiter
	- end index of line including line delimiter(s) CR, LF or CRLF"

	| cr lf start sz nextLF nextCR |
	start := 1.
	sz := self size.
	cr := Character cr.
	nextCR := self indexOf: cr startingAt: 1.
	lf := Character lf.
	nextLF := self indexOf: lf startingAt: 1.
	sz = 0
		ifTrue: [ aBlock value: sz value: sz value: sz.
			^ self ].
	[ start <= sz ]
		whileTrue: [ (nextLF = 0 and: [ nextCR = 0 ])
				ifTrue: [ "No more CR, nor LF, the string is over"
					aBlock value: start value: sz value: sz.
					^ self ].
			(nextCR = 0 or: [ 0 < nextLF and: [ nextLF < nextCR ] ])
				ifTrue: [ "Found a LF"
					aBlock value: start value: nextLF - 1 value: nextLF.
					start := 1 + nextLF.
					nextLF := self indexOf: lf startingAt: start ]
				ifFalse: [ 1 + nextCR = nextLF
						ifTrue: [ "Found a CR-LF pair"
							aBlock value: start value: nextCR - 1 value: nextLF.
							start := 1 + nextLF.
							nextCR := self indexOf: cr startingAt: start.
							nextLF := self indexOf: lf startingAt: start ]
						ifFalse: [ "Found a CR"
							aBlock value: start value: nextCR - 1 value: nextCR.
							start := 1 + nextCR.
							nextCR := self indexOf: cr startingAt: start ] ] ].
	aBlock value: start value: sz value: sz
]

{ #category : '*TreeSitter' }
String >> tsLines [
	"Same as lines but empty line exist"

	^ Array
		  new: (self size // 60 max: 16)
		  streamContents: [ :lines |
		  self tsLinesDo: [ :aLine | lines nextPut: aLine ] ]
]

{ #category : '*TreeSitter' }
String >> tsLinesDo: aBlock [
	"Same as linesDo but empty line exist"

	self
		tsLineIndicesDo: [ :start :endWithoutDelimiters :end |
			| begin |
			"endWithoutDelimiters = start
				ifTrue: [ aBlock value: '' ]
				ifFalse: [" 
					begin := (start = 0) ifTrue: [ 1 ] ifFalse: [ start ].  
					aBlock value: (self copyFrom: begin to: end) "]" ]
]
