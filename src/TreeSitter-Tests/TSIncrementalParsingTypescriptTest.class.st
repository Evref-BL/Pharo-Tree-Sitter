Class {
	#name : 'TSIncrementalParsingTypescriptTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Tests-IncrementalParsing-Typescript',
	#package : 'TreeSitter-Tests',
	#tag : 'IncrementalParsing-Typescript'
}

{ #category : 'as yet unclassified' }
TSIncrementalParsingTypescriptTest >> editTree: oldTree forBasicExample: oldString [ 

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := 'function printHello(): void { console.log(''Hello!''); console.log(''hi!''); }'.

	aTSInputEdit := TSInputEdit new.

	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: oldString size .
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: oldString size . 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: newString size .   
	
	aTSInputEdit
		startByte: oldString size;
		oldEndByte: oldString size;
		newEndByte: newString size;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree. 
	
	^ newTree
]

{ #category : 'running' }
TSIncrementalParsingTypescriptTest >> setUp [

	super setUp.

	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript .
	parser language: typescriptLanguage.
]

{ #category : 'running' }
TSIncrementalParsingTypescriptTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingBasic [

	| originalString originalTree  newTree|

	originalString := 'function printHello(): void { console.log(''Hello!''); }'.
	originalTree := parser parseString: originalString.
	originalTree rootNode. 
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert:  originalTree rootNode collectNamedChild first collectNamedChild fourth collectNamedChild size equals: 1.
	
	newTree := self editTree: originalTree forBasicExample: originalString .
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild first collectNamedChild fourth collectNamedChild size equals: 2.
	

]
