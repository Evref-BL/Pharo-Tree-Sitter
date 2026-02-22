"
I am a context entry during a FAST import. 

The import will save a stack of entries during the import. We will have one entry by nesting level of nodes. 

The entry will save multiple interesting informations such has:
- The fast entity produced by the node
- The TSNode corresponding to the context
- The filed name containing the nodes been pushed later on the stack 
- The fm property corresponding to the field been visited

Those info will be useful to import and also to customize the importers with `TSFASTCustomizableImporter`.

## Customize fields names

Also, I allow the customizable importer to define some aliases for some fields. 
This is useful if we have a field matching a FM property but not with the same name. 
For example in Python the `FASTTBinaryExpression` defines `leftOperand` and `rightOperand` but the fields in the node of type `binary_operator` are called `left` and `right`. 

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


"
Class {
	#name : 'TSFASTContextEntry',
	#superclass : 'Object',
	#instVars : [
		'fastEntity',
		'tsNode',
		'field',
		'fmProperty',
		'fieldsAliasMap'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'accessing' }
TSFASTContextEntry class >> fastEntity: anEntity tsNode: aNode [

	^ self new
		  fastEntity: anEntity;
		  tsNode: aNode;
		  yourself
]

{ #category : 'adding' }
TSFASTContextEntry >> add: aString asAliasOfField: anotherString [
	"See my class comment for more info."

	fieldsAliasMap ifNil: [ fieldsAliasMap := Dictionary new ].

	(fieldsAliasMap at: anotherString ifAbsentPut: [ OrderedCollection new ]) add: aString
]

{ #category : 'accessing' }
TSFASTContextEntry >> fastEntity [

	^ fastEntity
]

{ #category : 'accessing' }
TSFASTContextEntry >> fastEntity: anObject [

	fastEntity := anObject
]

{ #category : 'accessing' }
TSFASTContextEntry >> field [

	^ field
]

{ #category : 'accessing' }
TSFASTContextEntry >> field: anObject [

	field := anObject.
	fmProperty := nil "If we change the field, the property should be discarded since it is linked to the property"
]

{ #category : 'testing' }
TSFASTContextEntry >> fieldMatchesProperty: aFMProperty [
	"My field matches the property if the property has the same name as the field or as an alias of the field."

	aFMProperty name = field ifTrue: [ ^ true ].

	fieldsAliasMap ifNotNil: [ fieldsAliasMap at: field ifPresent: [ :aliases | (aliases includes: aFMProperty name) ifTrue: [ ^ true ] ] ].

	^ false
]

{ #category : 'accessing' }
TSFASTContextEntry >> fmProperty [

	^ fmProperty
]

{ #category : 'accessing' }
TSFASTContextEntry >> fmProperty: anObject [

	fmProperty := anObject
]

{ #category : 'printing' }
TSFASTContextEntry >> printOn: aStream [

	super printOn: aStream.

	aStream nextPutAll: ' ('.

	self fastEntity
		ifNil: [ aStream nextPutAll: 'No fast entity' ]
		ifNotNil: [ :entity | aStream print: entity class ].

	self field ifNotNil: [
			aStream
				nextPutAll: ' - from field: ';
				nextPutAll: self field ].

	aStream nextPutAll: ')'
]

{ #category : 'accessing' }
TSFASTContextEntry >> tsNode [

	^ tsNode
]

{ #category : 'accessing' }
TSFASTContextEntry >> tsNode: anObject [

	tsNode := anObject
]
