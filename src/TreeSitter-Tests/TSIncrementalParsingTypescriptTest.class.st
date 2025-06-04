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

{ #category : 'editing' }
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

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteBeginingExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringDeleteBeginning.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 1 andColumn: 33. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 69;
		newEndByte: 0;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteEndExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringDeleteEnd.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 9 andColumn: 51.
	oldPoint := aTSInputEdit createPointWithRow: 9 andColumn: 51. 
	newPoint := aTSInputEdit createPointWithRow: 9 andColumn: 51.   
	
	aTSInputEdit
		startByte: 224;
		oldEndByte: 255;
		newEndByte: 224;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteMiddleExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringDeleteMiddle.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 6 andColumn: 36.
	oldPoint := aTSInputEdit createPointWithRow: 6 andColumn: 42. 
	newPoint := aTSInputEdit createPointWithRow: 6 andColumn: 36.   
	
	aTSInputEdit
		startByte: 141;
		oldEndByte: 147;
		newEndByte: 141;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertBeginingExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringInsertBeginning.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 10.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 0;
		newEndByte: 10;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertEndExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringInsertEnd.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27.
	oldPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27. 
	newPoint := aTSInputEdit createPointWithRow: 12 andColumn: 21.   
	
	aTSInputEdit
		startByte: 255;
		oldEndByte: 255;
		newEndByte: 278;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertMiddleExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringInsertMiddle.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 7 andColumn: 1.
	oldPoint := aTSInputEdit createPointWithRow: 7 andColumn: 1. 
	newPoint := aTSInputEdit createPointWithRow: 9 andColumn: 22.   
	
	aTSInputEdit
		startByte: 169;
		oldEndByte: 169;
		newEndByte: 195;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateBeginingExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringUpdateBegining.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 0 andColumn: 0.
	oldPoint := aTSInputEdit createPointWithRow: 0 andColumn: 9. 
	newPoint := aTSInputEdit createPointWithRow: 0 andColumn: 1.   
	
	aTSInputEdit
		startByte: 0;
		oldEndByte: 9;
		newEndByte: 1;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateEndExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringUpdateEnd.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 11 andColumn: 26.
	oldPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27. 
	newPoint := aTSInputEdit createPointWithRow: 11 andColumn: 27.   
	
	aTSInputEdit
		startByte: 254;
		oldEndByte: 255;
		newEndByte: 255;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateMiddleExampleUsing: oldTree [   

	|newString aTSInputEdit startPoint oldPoint newPoint newTree|
	
	newString := self newStringUpdateMiddle.

	aTSInputEdit := TSInputEdit new. 
	
	startPoint := aTSInputEdit createPointWithRow: 9 andColumn: 43.
	oldPoint := aTSInputEdit createPointWithRow: 9 andColumn: 47. 
	newPoint := aTSInputEdit createPointWithRow: 9 andColumn: 48.   
	
	aTSInputEdit
		startByte: 216;
		oldEndByte: 220;
		newEndByte: 221;
		startPoint: startPoint;
		oldEndPoint: oldPoint;
		newEndPoint: newPoint.
	
	parser editTree: oldTree usingInputEdit: aTSInputEdit.
	newTree := parser parseString: newString usingTree: oldTree.
	
	^ newTree
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteBeginning [

	"deleting the interface at the beginning"

	^ 'function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteEnd [

	"remove the log at the end"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteMiddle [

	"remove space between firstName and LastName"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringInsertBeginning [

	"let's say a new statement is added at the begining"

	^ 'let x = 1;
interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringInsertEnd [

	"Let's say another log is added at the end"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));
console.log("End !");'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringInsertMiddle [

	"let's say the developer added a log in the middle"

	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

console.log("Begin!");

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringUpdateBegining [
	
	"let's say the developer intends to make changes and replace the interface by a const"
	
	^ 'c Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringUpdateEnd [
	
	"let's say by mistake ; replaced by . at the end"
	
	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user)).'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringUpdateMiddle [

	"Updating value of last name "
	
	^ 'interface Person {
	firstName: string;
	lastName: string;
}
   
function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "Frost" };

console.log(greeter(user));'
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> originalStringToParse [

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
TSIncrementalParsingTypescriptTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript.
	parser language: typescriptLanguage
]

{ #category : 'running' }
TSIncrementalParsingTypescriptTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingBasic [

	| originalString originalTree newTree|

	originalString := 'function printHello(): void { console.log(''Hello!''); }'.
	originalTree := parser parseString: originalString.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert:  originalTree rootNode firstNamedChild collectNamedChild fourth collectNamedChild size equals: 1.
	
	newTree := self editTree: originalTree forBasicExample: originalString.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode firstNamedChild collectNamedChild fourth collectNamedChild size equals: 2.
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForDeleteBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 3.
	self assert:  newTree rootNode firstNamedChild type equals: 'function_declaration'. 
	self assert:  newTree rootNode endByte equals: self newStringDeleteBeginning size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.  
			
	newTree := self editTreeForDeleteEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert: newTree rootNode collectNamedChild size equals: 3.	
	self assert: newTree rootNode endByte equals: self newStringDeleteEnd size . 
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild second collectNamedChild third firstNamedChild firstNamedChild firstNamedChild firstNamedChild type equals: 'binary_expression'. "before deleting we had 3 levels of firstNamedChild"
			
	newTree := self editTreeForDeleteMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 4.
	self assert:  newTree rootNode collectNamedChild second collectNamedChild third firstNamedChild firstNamedChild firstNamedChild type equals: 'binary_expression'. "after deleting we have 2 levels of firstNamedChild" 
	self assert:  newTree rootNode endByte equals: self newStringDeleteMiddle size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForInsertBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode firstNamedChild type equals: 'lexical_declaration'.	
	self assert:  newTree rootNode endByte equals: self newStringInsertBeginning size .
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.
			
	newTree := self editTreeForInsertEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode collectNamedChild fifth type equals: 'expression_statement'.
	self assert:  newTree rootNode endByte equals: self newStringInsertEnd size .
	
	
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild third type equals: 'lexical_declaration'.
			
	newTree := self editTreeForInsertMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode collectNamedChild third type equals: 'expression_statement'. 	
	self assert:  newTree rootNode endByte equals: self newStringInsertMiddle size .
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForUpdateBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 5.
	self assert:  newTree rootNode firstNamedChild type equals: 'ERROR'.
 	self assert:  newTree rootNode collectNamedChild second type equals: 'statement_block'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateBegining size .
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.
			
	newTree := self editTreeForUpdateEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 4.
	self assert:  newTree rootNode collectNamedChild fourth type equals: 'ERROR'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateEnd size . 
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	self assert: originalTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForUpdateMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: 4.
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateMiddle size .
	
	

]
