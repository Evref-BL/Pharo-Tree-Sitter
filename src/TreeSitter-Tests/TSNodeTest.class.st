Class {
	#name : 'TSNodeTest',
	#superclass : 'TestCase',
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'accessing' }
TSNodeTest class >> resources [

	^ { TSNodeTestResource }
]

{ #category : 'running' }
TSNodeTest >> binaryReadStream [

	^ self sourceCode utf8Encoded readStream
]

{ #category : 'accessing' }
TSNodeTest >> resource [

	^ TSNodeTestResource current
]

{ #category : 'accessing' }
TSNodeTest >> rootNode [

	^ self resource rootNode
]

{ #category : 'running' }
TSNodeTest >> sourceCode [

	^ self resource sourceCode
]

{ #category : 'tests' }
TSNodeTest >> testChildCound [
 
	self assert: self rootNode childCount equals: 1. 
	self assert: self rootNode firstNamedChild childCount equals: 4. "not sure why 4 and not 3"

]

{ #category : 'tests' }
TSNodeTest >> testCollectFieldNameOfNamedChild [

	| dict |
	dict := self rootNode firstNamedChild collectFieldNameOfNamedChild.

	self assert: dict keys size equals: 3.
	self assert: dict keys first equals: 'name'.
	self assert: dict keys second equals: 'parameters'.
	self assert: dict keys third equals: 'body'
]

{ #category : 'tests' }
TSNodeTest >> testCollectNamedChild [

	| childs |
	childs := self rootNode firstNamedChild collectNamedChild.

	self assert: childs size equals: 3.
	self assert: childs second collectNamedChild size equals: 1
]

{ #category : 'tests' }
TSNodeTest >> testDetectChildWithFieldName [ 
  
	|childs|
	
	childs := self rootNode firstNamedChild.

	self assert: (childs detectChildWithFieldName: 'name') type equals: 'identifier'. 
	self assert: (childs detectChildWithFieldName: 'parameters') type equals: 'formal_parameters'.
	self assert: (childs detectChildWithFieldName: 'body') type equals: 'statement_block'.
	
	
	
]

{ #category : 'tests' }
TSNodeTest >> testEndByte [ 
    
	self assert: self rootNode endByte equals: 71.
	self assert: self rootNode endByte equals: self sourceCode utf8Encoded size. 
	self assert: self rootNode firstNamedChild firstNamedChild endByte equals: 19.
	
	
	
]

{ #category : 'tests' }
TSNodeTest >> testEndPoint [
    
	self assert: self rootNode endPoint row equals: 2.
	self assert: self rootNode endPoint column equals: 6.
	self assert: self rootNode firstNamedChild firstNamedChild endPoint row equals: 0.
	self assert: self rootNode firstNamedChild firstNamedChild endPoint column equals: 19.
	
]

{ #category : 'tests' }
TSNodeTest >> testEndPositionFrom [

	self assert: (self rootNode endPositionFrom: self binaryReadStream) equals: 70.
	self assert: (self rootNode firstNamedChild endPositionFrom: self binaryReadStream) equals: 70
]

{ #category : 'tests' }
TSNodeTest >> testEndPositionFromEncoding [

	self assert: (self rootNode endPositionFrom: self binaryReadStream encoding: #utf8) equals: 70.
	self assert: (self rootNode firstNamedChild endPositionFrom: self binaryReadStream encoding: #utf8) equals: 70
]

{ #category : 'tests' }
TSNodeTest >> testEndPositionFromSourceText [

	self assert: (self rootNode endPositionFromSourceText: self sourceCode) equals: 70.
	self assert: (self rootNode firstNamedChild endPositionFromSourceText: self sourceCode) equals: 70
]

{ #category : 'tests' }
TSNodeTest >> testFieldNameOfChildNamedAt [
    
	self assert: (self rootNode fieldNameOfChildNamedAt: 1) equals: ''.
	self assert: (self rootNode firstNamedChild fieldNameOfChildNamedAt: 1) equals: 'name'.
 	self assert: (self rootNode firstNamedChild fieldNameOfChildNamedAt: 2) equals: 'parameters'.
 	self assert: (self rootNode firstNamedChild fieldNameOfChildNamedAt: 3) equals: 'body'.
 
]

{ #category : 'tests' }
TSNodeTest >> testFirstNamedChild [
    
	self assert: self rootNode firstNamedChild isNotNil. 
	self assert: self rootNode firstNamedChild class equals: TSNode. 
	self assert: self rootNode firstNamedChild type equals: 'function_declaration'. 
]

{ #category : 'tests' }
TSNodeTest >> testHasChanges [
    
	self assert: self rootNode hasChanges equals: false .
	self assert: self rootNode firstNamedChild hasChanges equals: false. 
]

{ #category : 'tests' }
TSNodeTest >> testIsEqualTo [

	self deny: (self rootNode isEqualTo: self rootNode firstNamedChild).
	self assert: (self rootNode firstNamedChild isEqualTo: (self rootNode namedChildAt: 1))
]

{ #category : 'tests' }
TSNodeTest >> testIsNamed [

	self assert: self rootNode isNamed.
	self assert: self rootNode firstNamedChild isNamed
]

{ #category : 'tests' }
TSNodeTest >> testIsNull [

	self deny: self rootNode isNull.
	self deny: self rootNode firstNamedChild isNull
]

{ #category : 'tests' }
TSNodeTest >> testNamedChildAt [

	self assert: (self rootNode namedChildAt: 1) class equals: TSNode.
	self assert: (self rootNode namedChildAt: 1) type equals: 'function_declaration'.
	self assert: (self rootNode firstNamedChild namedChildAt: 1) type equals: 'identifier'.
	self assert: (self rootNode firstNamedChild namedChildAt: 2) type equals: 'formal_parameters'.
	self assert: (self rootNode firstNamedChild namedChildAt: 3) type equals: 'statement_block'
]

{ #category : 'tests' }
TSNodeTest >> testNamedChildCount [

	self assert: self rootNode namedChildCount equals: 1.
	self assert: self rootNode firstNamedChild namedChildCount equals: 3.
	self assert: (self rootNode firstNamedChild namedChildAt: 2) firstNamedChild namedChildCount equals: 2
]

{ #category : 'tests' }
TSNodeTest >> testNamedChildren [

	self assert: self rootNode namedChildren isNotNil.
	self assert: self rootNode namedChildren size equals: 1.
	self assert: (self rootNode namedChildren first isEqualTo: self rootNode firstNamedChild)
]

{ #category : 'tests' }
TSNodeTest >> testNextSibling [

	| firstChild secondChild |
	firstChild := self rootNode firstNamedChild namedChildAt: 1.
	self assert: firstChild nextSibling isNotNil.
	self assert: firstChild nextSibling type equals: 'formal_parameters'.

	secondChild := self rootNode firstNamedChild namedChildAt: 2.
	self assert: secondChild nextSibling isNotNil.
	self assert: secondChild nextSibling type equals: 'statement_block'
]

{ #category : 'tests' }
TSNodeTest >> testParent [

	self assert: self rootNode firstNamedChild parent isNotNil.
	self assert: self rootNode firstNamedChild parent type equals: 'program'.
	self assert: (self rootNode firstNamedChild parent isEqualTo: self rootNode)
]

{ #category : 'tests' }
TSNodeTest >> testPreviousSibling [

	| firstChild secondChild |
	firstChild := self rootNode firstNamedChild namedChildAt: 2.
	self assert: firstChild previousSibling isNotNil.
	self assert: firstChild previousSibling type equals: 'identifier'.

	secondChild := self rootNode firstNamedChild namedChildAt: 3.
	self assert: secondChild previousSibling isNotNil.
	self assert: secondChild previousSibling type equals: 'formal_parameters'
]

{ #category : 'tests' }
TSNodeTest >> testStartByte [

	self assert: self rootNode startByte equals: 0.
	self assert: self rootNode firstNamedChild firstNamedChild startByte equals: 9
]

{ #category : 'tests' }
TSNodeTest >> testStartPoint [
    
	self assert: self rootNode startPoint row equals: 0.
	self assert: self rootNode startPoint column equals: 0.
	self assert: self rootNode firstNamedChild firstNamedChild startPoint row equals: 0.
	self assert: self rootNode firstNamedChild firstNamedChild startPoint column equals: 9.
	
]

{ #category : 'tests' }
TSNodeTest >> testStartPositionFrom [

	self assert: (self rootNode startPositionFrom: self binaryReadStream) equals: 1.
	self assert: (self rootNode firstNamedChild startPositionFrom: self binaryReadStream) equals: 1
]

{ #category : 'tests' }
TSNodeTest >> testStartPositionFromEncoding [

	self assert: (self rootNode startPositionFrom: self binaryReadStream encoding: #utf8) equals: 1.
	self assert: (self rootNode firstNamedChild startPositionFrom: self binaryReadStream encoding: #utf8) equals: 1
]

{ #category : 'tests' }
TSNodeTest >> testStartPositionFromSourceText [

	self assert: (self rootNode startPositionFromSourceText: self sourceCode) equals: 1.
	self assert: (self rootNode firstNamedChild startPositionFromSourceText: self sourceCode) equals: 1
]

{ #category : 'tests' }
TSNodeTest >> testString [

	self assert: self rootNode string isNotNil.
	self
		assert: self rootNode string
		equals:
		'(program (function_declaration name: (identifier) parameters: (formal_parameters (required_parameter pattern: (identifier) type: (type_annotation (type_identifier)))) body: (statement_block (comment))))'.
	self
		assert: self rootNode firstNamedChild string
		equals:
		'(function_declaration name: (identifier) parameters: (formal_parameters (required_parameter pattern: (identifier) type: (type_annotation (type_identifier)))) body: (statement_block (comment)))'.

	self assert: self rootNode string size > self rootNode firstNamedChild string size
]

{ #category : 'tests' }
TSNodeTest >> testSymbol [

	self assert: self rootNode symbol isNotNil.
	self assert: self rootNode symbol equals: 166.
	self assert: self rootNode firstNamedChild symbol equals: 224
]

{ #category : 'tests' }
TSNodeTest >> testTextFrom [

	self assert: (self rootNode textFrom: self binaryReadStream) equals: self sourceCode.
	self assert: (self rootNode firstNamedChild textFrom: self binaryReadStream) equals: 'function deleteUser(user: User) {
  					// This is a comment é
				 }'
]

{ #category : 'tests' }
TSNodeTest >> testTextFromEncoding [

	self assert: (self rootNode textFrom: self binaryReadStream encoding: #utf8) equals: self sourceCode.
	self assert: (self rootNode firstNamedChild textFrom: self binaryReadStream encoding: #utf8) equals: 'function deleteUser(user: User) {
  					// This is a comment é
				 }'
]

{ #category : 'tests' }
TSNodeTest >> testTextFromEncodingSourceText [

	self assert: (self rootNode textFromSourceText: self sourceCode) equals: self sourceCode withUnixLineEndings.
	self assert: (self rootNode firstNamedChild textFromSourceText: self sourceCode) equals: 'function deleteUser(user: User) {
  					// This is a comment é
				 }' withUnixLineEndings
]

{ #category : 'tests' }
TSNodeTest >> testType [ 
 
	self assert: self rootNode type isNotNil.
	self assert: self rootNode type equals: 'program'.
	 
	
	
 
]
