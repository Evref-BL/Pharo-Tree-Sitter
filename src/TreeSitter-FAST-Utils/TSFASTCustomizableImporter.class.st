"
I am aa FAST importer whose goal is to be customizable in order to tweak the FAST model produced and not have a 1-1 mapping.

I can be subclassed for a specific language.

## How to customize your FAST model?

### Alias TreeSitter fields names to match FM properties

It happens that a TSNode has some children an a field matching a contained entity fame property but their name differ.
By default the importer will look for properties with the same name as a field to set the children in the right variable but I offer way to provide the right name to the importer.

For example in Python the `FASTTBinaryExpression` defines `leftOperand` and `rightOperand` but the fields in the node of type `binary_operator` are called `left` and `right`. 
We can alias this using the context entry of an entity.

Here is how to manage this:

```st
TSFASTPythonImporter>>visitBinaryOperator: aTSNode

	| fastEntity |
	fastEntity := self instantiateFastEntity: FASTPythonBinaryOperator from: aTSNode.

	context top fastEntity addGenericChildren: fastEntity. ""Should this be a generic child?""

	self pushContext: fastEntity node: aTSNode during: [
			context top add: 'leftOperand' asAliasOfField: 'left'.
			context top add: 'rightOperand' asAliasOfField: 'right'.
			self visitChildren: aTSNode in: fastEntity ].

	^ fastEntity
```



TODO: Add more documentation
"
Class {
	#name : 'TSFASTCustomizableImporter',
	#superclass : 'TSFASTImporter',
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'private' }
TSFASTCustomizableImporter >> buildVisitMethodNameFor: aTSNode [

	^ (String streamContents: [ :aStream |
			   aStream nextPutAll: 'visit'.
			   ($_ split: aTSNode type) do: [ :word | aStream nextPutAll: word capitalized ].
			   aStream nextPut: $: ]) asSymbol
]

{ #category : 'reflective operations' }
TSFASTCustomizableImporter >> doesNotUnderstand: aMessage [

	(aMessage selector beginsWith: 'visit') ifTrue: [ ^ super visitNode: aMessage argument ].

	^ super doesNotUnderstand: aMessage
]

{ #category : 'accessing' }
TSFASTCustomizableImporter >> sourceCodeOf: aTSNode [

	^ aTSNode textFromSourceText: self originString
]

{ #category : 'visiting' }
TSFASTCustomizableImporter >> visitNode: aTSNode [
	"Here we are performing a special visit method. If it is not implemented the #doesNotUnderstood: will call my super visitNode:. The reason we are doing this is to simplify the debugging of a visitor to not have to step over a lot of method calls..."

	^ self handleErrorsDuring: [ self perform: (self buildVisitMethodNameFor: aTSNode) with: aTSNode ]
]
