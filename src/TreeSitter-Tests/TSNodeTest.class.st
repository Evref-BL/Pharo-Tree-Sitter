Class {
	#name : 'TSNodeTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'rootNode',
		'stringToParse'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'parsing' }
TSNodeTest >> parseFunction [
	 
	stringToParse := 'function deleteUser(user: User) {
  					// This is a comment
				 }'. 
	^ parser parseString: stringToParse.
]

{ #category : 'running' }
TSNodeTest >> setUp [

	|tree|
	super setUp.
	parser := TSParser new. 
	parser language:TSLanguage typescript.
	tree := self parseFunction.  
	rootNode := tree rootNode.
	

]

{ #category : 'running' }
TSNodeTest >> tearDown [

	parser delete.
	super tearDown.

]

{ #category : 'tests' }
TSNodeTest >> testChildCound [
 
	self assert: rootNode childCount equals: 1. 
	self assert: rootNode firstNamedChild childCount equals: 4. "not sure why 4 and not 3"

]

{ #category : 'tests' }
TSNodeTest >> testCollectFieldNameOfNamedChild [
  
	|dict|
	
	dict := rootNode firstNamedChild collectFieldNameOfNamedChild.

	self assert: dict keys size equals: 3.
	self assert: dict keys first equals: 'name'.
	self assert: dict keys second equals: 'parameters'.
	self assert: dict keys third equals: 'body'.
	
]

{ #category : 'tests' }
TSNodeTest >> testCollectNamedChild [
  
	|childs|
	
	childs := rootNode firstNamedChild collectNamedChild.

	self assert: childs size equals: 3.
	self assert: childs second collectNamedChild size equals: 1.
	
	
	
	
]

{ #category : 'tests' }
TSNodeTest >> testDetectChildWithFieldName [ 
  
	|childs|
	
	childs := rootNode firstNamedChild.

	self assert: (childs detectChildWithFieldName: 'name') type equals: 'identifier'. 
	self assert: (childs detectChildWithFieldName: 'parameters') type equals: 'formal_parameters'.
	self assert: (childs detectChildWithFieldName: 'body') type equals: 'statement_block'.
	
	
	
]

{ #category : 'tests' }
TSNodeTest >> testEndByte [ 
    
	self assert: rootNode endByte equals: 68.
	self assert: rootNode endByte equals: stringToParse size. 
	self assert: rootNode firstNamedChild firstNamedChild endByte equals: 19.
	
	
	
]

{ #category : 'tests' }
TSNodeTest >> testEndPoint [
    
	self assert: rootNode endPoint row equals: 2.
	self assert: rootNode endPoint column equals: 6.
	self assert: rootNode firstNamedChild firstNamedChild endPoint row equals: 0.
	self assert: rootNode firstNamedChild firstNamedChild endPoint column equals: 19.
	
]

{ #category : 'tests' }
TSNodeTest >> testFieldNameOfChildNamedAt [
    
	self assert: (rootNode fieldNameOfChildNamedAt: 1) equals: ''.
	self assert: (rootNode firstNamedChild fieldNameOfChildNamedAt: 1) equals: 'name'.
 	self assert: (rootNode firstNamedChild fieldNameOfChildNamedAt: 2) equals: 'parameters'.
 	self assert: (rootNode firstNamedChild fieldNameOfChildNamedAt: 3) equals: 'body'.
 
]

{ #category : 'tests' }
TSNodeTest >> testFirstNamedChild [
    
	self assert: rootNode firstNamedChild isNotNil. 
	self assert: rootNode firstNamedChild class equals: TSNode. 
	self assert: rootNode firstNamedChild type equals: 'function_declaration'. 
]

{ #category : 'tests' }
TSNodeTest >> testHasChanges [
    
	self assert: rootNode hasChanges equals: false .
	self assert: rootNode firstNamedChild hasChanges equals: false. 
]

{ #category : 'tests' }
TSNodeTest >> testIsEqualTo [
    
	self assert: (rootNode isEqualTo: rootNode firstNamedChild ) equals: false.
	self assert: (rootNode firstNamedChild isEqualTo: (rootNode namedChildAt: 1) ) equals: true.
]

{ #category : 'tests' }
TSNodeTest >> testIsNamed [
    
	self assert: rootNode isNamed.
	self assert: rootNode firstNamedChild isNamed.
	
]

{ #category : 'tests' }
TSNodeTest >> testIsNull [
    
	self assert: rootNode isNull equals: false .
	self assert: rootNode firstNamedChild isNull equals: false .
	
]

{ #category : 'tests' }
TSNodeTest >> testNamedChildAt [
    
	self assert: (rootNode namedChildAt: 1) class equals: TSNode .
	self assert: (rootNode namedChildAt: 1) type equals: 'function_declaration'.
	self assert: (rootNode firstNamedChild namedChildAt: 1) type equals: 'identifier'.
	self assert: (rootNode firstNamedChild namedChildAt: 2) type equals: 'formal_parameters'.
	self assert: (rootNode firstNamedChild namedChildAt: 3) type equals: 'statement_block'.
]

{ #category : 'tests' }
TSNodeTest >> testNamedChildCount [
    
	self assert: rootNode namedChildCount equals: 1 .
	self assert: rootNode firstNamedChild namedChildCount equals: 3 .
	self assert: (rootNode firstNamedChild namedChildAt: 2) firstNamedChild namedChildCount equals: 2.
]

{ #category : 'tests' }
TSNodeTest >> testNamedChildren [
    
	self assert: rootNode namedChildren isNotNil. 
	self assert: rootNode namedChildren size equals: 1.	
	self assert: (rootNode namedChildren first isEqualTo: rootNode firstNamedChild ).
]

{ #category : 'tests' }
TSNodeTest >> testNextSibling [
    
	|firstChild secondChild|

	firstChild := rootNode firstNamedChild namedChildAt: 1 .
	self assert: firstChild nextSibling isNotNil. 
	self assert: firstChild nextSibling type equals: 'formal_parameters'.
	
	secondChild := rootNode firstNamedChild namedChildAt: 2 .
	self assert: secondChild nextSibling isNotNil. 
	self assert: secondChild nextSibling type equals: 'statement_block'.
	
	
	
	 
]

{ #category : 'tests' }
TSNodeTest >> testParent [
   
	self assert: rootNode firstNamedChild parent isNotNil. 
	self assert: rootNode firstNamedChild parent type equals: 'program'. 
	self assert: (rootNode firstNamedChild parent isEqualTo: rootNode). 
	
	 
]

{ #category : 'tests' }
TSNodeTest >> testPreviousSibling [
    
	|firstChild secondChild|

	firstChild := rootNode firstNamedChild namedChildAt: 2 .
	self assert: firstChild previousSibling isNotNil. 
	self assert: firstChild previousSibling type equals: 'identifier'.
	
	secondChild := rootNode firstNamedChild namedChildAt: 3 .
	self assert: secondChild previousSibling isNotNil. 
	self assert: secondChild previousSibling type equals: 'formal_parameters'.
	
	
	
	 
]

{ #category : 'tests' }
TSNodeTest >> testStartByte [ 
    
	self assert: rootNode startByte equals: 0. 
	self assert: rootNode firstNamedChild firstNamedChild startByte equals: 9. 
	
]

{ #category : 'tests' }
TSNodeTest >> testStartPoint [
    
	self assert: rootNode startPoint row equals: 0.
	self assert: rootNode startPoint column equals: 0.
	self assert: rootNode firstNamedChild firstNamedChild startPoint row equals: 0.
	self assert: rootNode firstNamedChild firstNamedChild startPoint column equals: 9.
	
]

{ #category : 'tests' }
TSNodeTest >> testString [
 
	self assert: rootNode string isNotNil.
	self assert: rootNode string equals: '(program (function_declaration name: (identifier) parameters: (formal_parameters (required_parameter pattern: (identifier) type: (type_annotation (type_identifier)))) body: (statement_block (comment))))'.
	self assert: rootNode firstNamedChild string equals: '(function_declaration name: (identifier) parameters: (formal_parameters (required_parameter pattern: (identifier) type: (type_annotation (type_identifier)))) body: (statement_block (comment)))'.
	
	self assert: ( rootNode string size > rootNode firstNamedChild string size)
]

{ #category : 'tests' }
TSNodeTest >> testSymbol [
 
	self assert: rootNode symbol isNotNil.
	self assert: rootNode symbol equals: 166.
	self assert: rootNode firstNamedChild symbol equals: 224.
	
	
 
]

{ #category : 'tests' }
TSNodeTest >> testType [ 
 
	self assert: rootNode type isNotNil.
	self assert: rootNode type equals: 'program'.
	 
	
	
 
]
