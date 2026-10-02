Class {
	#name : 'TSIncrementalParsingTypescriptTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Typescript-Tests',
	#package : 'TreeSitter-Typescript-Tests'
}

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTree: oldTree forBasicExample: oldString [ 

	^ self
		editTree: oldTree
		from: oldString
		to: 'function printHello(): void { console.log(''Hello!''); console.log(''hi!''); }'
]

{ #category : 'as yet unclassified' }
TSIncrementalParsingTypescriptTest >> editTree: oldTree from: oldString to: newString [  

	parser editTree: oldTree usingInputEdit: (TSInputEdit fromString: oldString to: newString).
	^ parser parseString: newString usingTree: oldTree 
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteBeginingExampleUsing: oldTree [   
 
	^ self editTree: oldTree from: self originalStringToParse to: self newStringDeleteBeginning 
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteEndExampleUsing: oldTree [   

	^ self editTree: oldTree from: self originalStringToParse to: self newStringDeleteEnd
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForDeleteMiddleExampleUsing: oldTree [   
  
	^ self editTree: oldTree from: self originalStringToParse to: self newStringDeleteMiddle
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertBeginingExampleUsing: oldTree [   
 
	^ self editTree: oldTree from: self originalStringToParse to: self newStringInsertBeginning
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertEndExampleUsing: oldTree [   

	^ self editTree: oldTree from: self originalStringToParse to: self newStringInsertEnd
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForInsertMiddleExampleUsing: oldTree [   

	^ self editTree: oldTree from: self originalStringToParse to: self newStringInsertMiddle
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateBeginingExampleUsing: oldTree [   

	^ self editTree: oldTree from: self originalStringToParse to: self newStringUpdateBegining
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateEndExampleUsing: oldTree [   

	^ self editTree: oldTree from: self originalStringToParse to: self newStringUpdateEnd
]

{ #category : 'editing' }
TSIncrementalParsingTypescriptTest >> editTreeForUpdateMiddleExampleUsing: oldTree [   

	^ self editTree: oldTree from: self originalStringToParse to: self newStringUpdateMiddle
]

{ #category : 'storing' }
TSIncrementalParsingTypescriptTest >> newStringDeleteBeginning [

	"deleting the interface at the beginning"

	^ 'function greeter(person: Person) {
	return "Hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "User" };

console.log(greeter(user));' withPlatformLineEndings
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

let user = { firstName: "Jane", lastName: "User" };' withPlatformLineEndings 
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

console.log(greeter(user));' withPlatformLineEndings
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

console.log(greeter(user));' withPlatformLineEndings
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
console.log("End !");' withPlatformLineEndings
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

console.log(greeter(user));' withPlatformLineEndings
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

console.log(greeter(user));' withPlatformLineEndings
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

console.log(greeter(user)).' withPlatformLineEndings
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

console.log(greeter(user));' withPlatformLineEndings
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

console.log(greeter(user));' withPlatformLineEndings
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
	"self assert:  originalTree rootNode firstNamedChild collectNamedChild fourth collectNamedChild size equals: 1."
	
	newTree := self editTree: originalTree forBasicExample: originalString.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode firstNamedChild collectNamedChild fourth collectNamedChild size > originalTree rootNode firstNamedChild collectNamedChild fourth collectNamedChild size.
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForDeleteBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size < originalTree rootNode collectNamedChild size.
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
	self assert: newTree rootNode collectNamedChild size < originalTree rootNode collectNamedChild size.	
	self assert: newTree rootNode endByte equals: self newStringDeleteEnd size . 
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingDeleteMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode collectNamedChild second collectNamedChild third firstNamedChild firstNamedChild firstNamedChild firstNamedChild type equals: 'binary_expression'. "before deleting we had 3 levels of firstNamedChild"
			
	newTree := self editTreeForDeleteMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode collectNamedChild second collectNamedChild third firstNamedChild firstNamedChild firstNamedChild type equals: 'binary_expression'. "after deleting we have 2 levels of firstNamedChild" 
	self assert:  newTree rootNode endByte equals: self newStringDeleteMiddle size .
]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertBeginning [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForInsertBeginingExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size > originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode firstNamedChild type equals: 'lexical_declaration'.	
	self assert:  newTree rootNode endByte equals: self newStringInsertBeginning size .
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertEnd [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.
			
	newTree := self editTreeForInsertEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size > originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode collectNamedChild fifth type equals: 'expression_statement'.
	self assert:  newTree rootNode endByte equals: self newStringInsertEnd size .
	
	
	
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingInsertMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode collectNamedChild third type equals: 'lexical_declaration'.
			
	newTree := self editTreeForInsertMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size > originalTree rootNode collectNamedChild size.
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
	self assert:  newTree rootNode collectNamedChild size > originalTree rootNode collectNamedChild size.
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
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode collectNamedChild fourth type equals: 'expression_statement'.
			
	newTree := self editTreeForUpdateEndExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: originalTree rootNode collectNamedChild size.
	self assert:  newTree rootNode collectNamedChild fourth type equals: 'ERROR'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateEnd size . 
	

]

{ #category : 'tests' }
TSIncrementalParsingTypescriptTest >> testTypescriptIncrementalParsingUpdateMiddle [

	| originalTree newTree|

	originalTree := parser parseString: self originalStringToParse.
	
	"before edit"
	self assert: originalTree rootNode hasChanges equals: false.
	"self assert: originalTree rootNode collectNamedChild size equals: 4."
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
			
	newTree := self editTreeForUpdateMiddleExampleUsing: originalTree.
	
	"after edit"
	self assert: originalTree rootNode hasChanges equals: true.	
	self assert: newTree rootNode hasChanges equals: false.		
	self assert:  newTree rootNode collectNamedChild size equals: originalTree rootNode collectNamedChild size.
	self assert:  originalTree rootNode firstNamedChild type equals: 'interface_declaration'.
	self assert:  newTree rootNode endByte equals: self newStringUpdateMiddle size .
	
	

]
