Class {
	#name : 'TSHighlighter',
	#superclass : 'Object',
	#instVars : [
		'attributeMapper',
		'parser',
		'string'
	],
	#category : 'TreeSitter-Highlighter',
	#package : 'TreeSitter-Highlighter'
}

{ #category : 'text coloring' }
TSHighlighter >> addAttribute: aTextAttribute for: anEntity [

	| attributes |
	attributes := self attributeMapper
		              at: anEntity
		              ifAbsentPut: [ OrderedCollection new ].
	attributes add: aTextAttribute
]

{ #category : 'accessing' }
TSHighlighter >> attributeMapper [
	"returns a dictionary with keys corresponding to parser names and 
	values corresponding to a collection of TextAttributes"

	^ attributeMapper
]

{ #category : 'accessing' }
TSHighlighter >> attributeMapper: aDictionary [

	attributeMapper := aDictionary
]

{ #category : 'text coloring' }
TSHighlighter >> bold: anElementString [

	self addAttribute: TextEmphasis bold for: anElementString
]

{ #category : 'text coloring' }
TSHighlighter >> color: anElementString with: aColor [

	self addAttribute: (TextColor new color: aColor) for: anElementString
]

{ #category : 'api' }
TSHighlighter >> highlight: aString [

	| text tree |
	text := aString asText.
	string := aString.
	tree := self parser parseString: aString.
	self highlight: text usingNode: tree rootNode.
	^ text
]

{ #category : 'api' }
TSHighlighter >> highlight: text usingNode: node [

	node isNamed ifTrue: [
		(node startPoint isNotNil and: [ node endPoint isNotNil ]) ifTrue: [
			attributeMapper at: node type ifPresent: [ :attributes |
				attributes do: [ :each |
					text
						addAttribute: each
						from: (string positionFromTSPoint: node startPoint) + 1
						to: (string positionFromTSPoint: node endPoint) ] ] ] ].
	1 to: node namedChildCount do: [ :idx |
	self highlight: text usingNode: (node namedChildAt: idx) ]
]

{ #category : 'initialization' }
TSHighlighter >> initialize [

	super initialize.
	attributeMapper := Dictionary new.
	self
		addAttribute: (SHRBTextStyler attributesFor: #comment) anyOne
		for: 'comment'.
	self
		addAttribute: (SHRBTextStyler attributesFor: #selector) anyOne
		for: 'identifier'.
	self
		addAttribute: (SHRBTextStyler attributesFor: #string) anyOne
		for: 'string'
]

{ #category : 'accessing' }
TSHighlighter >> parser [

	^ parser
]

{ #category : 'accessing' }
TSHighlighter >> parser: aTSParser [

	parser := aTSParser
]
