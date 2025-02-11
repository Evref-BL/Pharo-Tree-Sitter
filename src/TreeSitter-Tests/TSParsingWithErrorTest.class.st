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
TSParsingWithErrorTest >> editTree: originalTree forBasicExample1: originalString [

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

{ #category : 'storing' }
TSParsingWithErrorTest >> originalStringToParse [

	"original string where modifications will applied at the begining, middle and end for many cases: add update and delete"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
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
TSParsingWithErrorTest >> testError1 [

	| originalString originalTree newTree|

	originalString := 'function printHello(): void { console.log(''Hello!''); }'.
	originalTree := parser parseString: originalString.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert:  originalTree rootNode collectNamedChild size equals: 1.
	self assert:  originalTree rootNode collectNamedChild first type equals: 'function_declaration'.
	
	newTree := self editTree: originalTree forBasicExample1: originalString.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild first type equals: 'ERROR'.
]
