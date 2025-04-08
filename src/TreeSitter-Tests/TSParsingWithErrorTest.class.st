Class {
	#name : 'TSParsingWithErrorTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Tests-Parsing',
	#package : 'TreeSitter-Tests',
	#tag : 'Parsing'
}

{ #category : 'as yet unclassified' }
TSParsingWithErrorTest >> editTree: originalTree forBasicExample: originalString [

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := 'fu function printHello(): void { console.log("Hello!"); }'.

	aTSInputEdit := TSInputEdit new.

	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0 .
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: 3 . 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0 .   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 3;
		newEndByte: 0;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: originalTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: originalTree. 
	
	^ newTree
]

{ #category : 'running' }
TSParsingWithErrorTest >> setUp [

	super setUp.

	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript.
	parser language: typescriptLanguage .
]

{ #category : 'running' }
TSParsingWithErrorTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testEmptyStatement [

	| originalString tree |
	
	"the existence of double ; does not lead to error but to empty statement"
	
	originalString := 'console.log(''Hello!'');;'.
	tree := parser parseString: originalString.
	
	self deny: (tree rootNode namedChildAt: 2) isErrorNode.
	self assert: (tree rootNode namedChildAt: 2) type equals: 'empty_statement'
	
	
	
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testErrorAfterEdit [

	| originalString originalTree newTree|

	originalString := 'function printHello(): void { console.log(''Hello!''); }'.
	originalTree := parser parseString: originalString.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert:  originalTree rootNode collectNamedChild size equals: 1.
	
	"Originally the node was correct"
	self assert:  originalTree rootNode firstNamedChild type equals: 'function_declaration'.
	
	newTree := self editTree: originalTree forBasicExample: originalString.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	
	"Now after midification it should become incorrect"
	self assert:  newTree rootNode firstNamedChild type equals: 'ERROR'.
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testErrorBeginning [

	| originalString tree |

	originalString := 'const function printHello(): void { console.log(''Hello!'');} '.
	tree := parser parseString: originalString.
	
	"make sure that the first node is error"
	self assert:  tree rootNode firstNamedChild isErrorNode.
	self assert:  (tree rootNode firstNamedChild textFromSourceText: originalString) equals: 'const function printHello(): void' . 
	
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testErrorEnd [

	| originalString tree |

	originalString := 'function printHello(): void { console.log(''Hello!''); . } '.
	tree := parser parseString: originalString.
	
	"make sure that the main node is not error"
	self deny:  tree rootNode firstNamedChild type equals: 'ERROR'.
	self assert:  tree rootNode firstNamedChild type equals: 'function_declaration'.
		
	"check that the correct nodes are intact"
	self assert:  (tree rootNode namedChildren first namedChildAt: 4) firstNamedChild type equals: 'expression_statement'.
	
	"check that only the last node is ERROR"
	self assert:  (tree rootNode namedChildren first namedChildAt: 4) collectNamedChild last type equals: 'ERROR'. 
	self assert:  ((tree rootNode namedChildren first namedChildAt: 4) collectNamedChild last textFromSourceText: originalString) equals: '.' . 
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testErrorMiddle [

	| originalString tree |

	originalString := 'function printHello(): void { con console.log(''Hello!'');} '.
	tree := parser parseString: originalString.
	
	"make sure that the first node is error"
	self assert:  (tree rootNode firstNamedChild namedChildAt: 4) firstNamedChild isErrorNode. 	
	self assert:  ((tree rootNode firstNamedChild namedChildAt: 4) firstNamedChild  textFromSourceText: originalString) equals: 'con'
	
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testErrorNodeWithChildren [

	| originalString tree |
	
	"We realized that error node can have children or not; inserting const at the begining leads to having children for Error node"

	originalString := 'const function printHello(): void { console.log(''Hello!'');} '.
	tree := parser parseString: originalString.
	
	"make sure that the first node is error"
	self assert:  tree rootNode firstNamedChild isErrorNode. 
	
	"make sure that the error node has children"
	self assert:  tree rootNode firstNamedChild hasChildren.
	
	self assert: (tree rootNode firstNamedChild textFromSourceText: originalString) equals: 'const function printHello(): void'.
	
	
	
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testErrorNodeWithoutChildren [

	| originalString tree |
	
	"We realized that error node can have children or not; inserting . at the begining leads to not having children for Error node"

	originalString := '. function printHello(): void { console.log(''Hello!'');} '.
	tree := parser parseString: originalString.
	
	"make sure that the first node is error"
	self assert:  tree rootNode firstNamedChild isErrorNode. 
	
	"make sure that the error node has no children"
	self deny:  tree rootNode firstNamedChild hasChildren.
		
	self assert: (tree rootNode firstNamedChild textFromSourceText: originalString) equals: '.'.
	
]

{ #category : 'tests' }
TSParsingWithErrorTest >> testMultipleErrors [

	| originalString tree |
	
	"3 errors must be found here"
	
	originalString := '. function printHello(): void { v console.log(''Hello!'');.}'.
	tree := parser parseString: originalString.
	
	"finding first error"
	self assert:  tree rootNode firstNamedChild isErrorNode. 
	self assert:  (tree rootNode firstNamedChild textFromSourceText: originalString) equals: '.'.
	
	"finding second error"
	self assert:  ((tree rootNode namedChildAt: 2) namedChildAt: 4) firstNamedChild isErrorNode. 
	self assert:  (((tree rootNode namedChildAt: 2) namedChildAt: 4) firstNamedChild textFromSourceText: originalString) equals: 'v'.
	
	"finding third error"
	self assert:  (((tree rootNode namedChildAt: 2) namedChildAt: 4) namedChildAt: 3) isErrorNode.
	self assert:  ((((tree rootNode namedChildAt: 2) namedChildAt: 4) namedChildAt: 3) textFromSourceText: originalString) equals: '.'.
	
	
]
