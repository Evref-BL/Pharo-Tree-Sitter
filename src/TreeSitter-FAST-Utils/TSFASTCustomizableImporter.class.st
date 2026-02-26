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

	self setParentOf: fastEntity. ""Should this be a generic child?""

	self pushContext: fastEntity node: aTSNode during: [
			context top add: 'leftOperand' asAliasOfField: 'left'.
			context top add: 'rightOperand' asAliasOfField: 'right'.
			self visitChildren: aTSNode in: fastEntity ].

	^ fastEntity
```

But this is not all. This often make us duplicate the code to create the entity, set the parent and visit the children.

Instead of doing this, it is possible to just ask the visitor to customize the next context entry we will create. So we can just do something like this:

```st
TSFASTPythonImporter>>visitBinaryOperator: aTSNode

	self onNextContextDo: [ :contextEntry |
			contextEntry
				add: 'leftOperand' asAliasOfField: 'left';
				add: 'rightOperand' asAliasOfField: 'right' ].

	^ self createEntityForNode: aTSNode

```

Like this, we duplicate less code.



TODO: Add more documentation
"
Class {
	#name : 'TSFASTCustomizableImporter',
	#superclass : 'TSFASTImporter',
	#instVars : [
		'nextContextCustomization'
	],
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

{ #category : 'utilities' }
TSFASTCustomizableImporter >> customizeNewContext: aContextEntry [
	"This is a hook used to let the user customize the next context even before it is created. 
	This might be useful for example to add aliases to the fileds to import."

	nextContextCustomization ifNotNil: [
			nextContextCustomization value: aContextEntry.
			nextContextCustomization := nil ]
]

{ #category : 'reflective operations' }
TSFASTCustomizableImporter >> doesNotUnderstand: aMessage [

	(aMessage selector beginsWith: 'visit') ifTrue: [ ^ super visitNode: aMessage argument ].

	^ super doesNotUnderstand: aMessage
]

{ #category : 'actions' }
TSFASTCustomizableImporter >> onNextContextDo: aBlock [
	"Save a block to execute to customize the next context entry created"

	nextContextCustomization := aBlock
]

{ #category : 'utilities' }
TSFASTCustomizableImporter >> rawVisitChildren: aTSNode [
	"Like #visitChildren: I will visit the children of the TSNode, but I will not take care of updating the context in case we need to skip a level of TSNode.
	
	For example, this is useful in Python to manage aliased_import. An import has a import_statement node. This node has a field `name` that can either be a dotted_name or an aliased_import contaning the dotted_name and an identifier defining the alias. 
	In the #aliased_node, I skip the generic visit and I visit only the children. But since this skip a context entry, the fields should not be updated."

	aTSNode collectFieldNameOfNamedChild keysAndValuesDo: [ :field :nodes | nodes asTSNodes do: [ :node | node accept: self ] ]
]

{ #category : 'utilities' }
TSFASTCustomizableImporter >> sourceCodeOf: aTSNode [

	^ aTSNode textFromSourceText: self originString
]

{ #category : 'visiting' }
TSFASTCustomizableImporter >> visitNode: aTSNode [
	"Here we are performing a special visit method. If it is not implemented the #doesNotUnderstood: will call my super visitNode:. The reason we are doing this is to simplify the debugging of a visitor to not have to step over a lot of method calls..."

	^ self handleErrorsDuring: [ self perform: (self buildVisitMethodNameFor: aTSNode) with: aTSNode ]
]
