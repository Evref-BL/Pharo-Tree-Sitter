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

	self setParentOf: fastEntity. ""Should this be a generic child?""

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
		'fieldsAliasMap',
		'tsType'
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

{ #category : 'adding' }
TSFASTContextEntry >> aliasUnnamedFieldAs: aString [
	"Suggar since this happens a lot in customizable importers.."

	^ self add: aString asAliasOfField: '<unnamedChild>'
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
    | propName camelField |
    
    "Handle unnamed children (single or multiple)"
    (field isNil or: [ field isEmpty or: [ field = '<unnamedChild>' ] ]) ifTrue: [ 
        | pName |
        pName := aFMProperty name asString.
        ^ pName = 'childrenNodes' or: [ pName = 'childrenNode' ] ].
    
    propName := aFMProperty name asString.
    
    "Direct match"
    propName = field ifTrue: [ ^ true ].
    
    "Check aliases"
    fieldsAliasMap ifNotNil: [ 
        fieldsAliasMap at: field ifPresent: [ :aliases | 
            (aliases includes: aFMProperty name) ifTrue: [ ^ true ] ] ].
    
    "CamelCase conversion (type_parameters → typeParameters)"
    camelField := self toCamelCase: field.
    (camelField ~= field and: [ propName = camelField ]) ifTrue: [ ^ true ].
    
    "Reserved property names (tree-sitter 'type' → Famix 'typeRef')"
    camelField = 'type' ifTrue: [ propName = 'typeRef' ifTrue: [ ^ true ] ].
    
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

{ #category : 'testing' }
TSFASTContextEntry >> isOfFASTType: aFASTClassOrTrait [

	^ fastEntity isOfType: aFASTClassOrTrait
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

{ #category : 'utils' }
TSFASTContextEntry >> toCamelCase: aString [
    "Convert tree-sitter underscore_name to camelCase.
    Example: 'type_parameters' → 'typeParameters'"
    | parts |
    parts := aString asString substrings: '_'.
    ^ parts isEmpty 
        ifTrue: [ '' ] 
        ifFalse: [ parts first , (String streamContents: [ :s | 
            parts allButFirst do: [ :p | s nextPutAll: p capitalized ] ]) ]
]

{ #category : 'accessing' }
TSFASTContextEntry >> tsNode [

	^ tsNode
]

{ #category : 'accessing' }
TSFASTContextEntry >> tsNode: anObject [

	tsNode := anObject.
	tsType := nil
]

{ #category : 'accessing' }
TSFASTContextEntry >> tsType [
	"Caching this info because it takes time to do FFI calls."

	^ tsType ifNil: [ tsType := self tsNode type ]
]
