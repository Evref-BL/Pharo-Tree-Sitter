"
I am a context entry during a FAST import. 

The import will save a stack of entries during the import. We will have one entry by nesting level of nodes. 

The entry will save multiple interesting informations such has:
- The fast entity produced by the node
- The TSNode corresponding to the context
- The filed name containing the nodes been pushed later on the stack 
- The fm property corresponding to the field been visited

Those info will be useful to import and also to customize the importers with `TSFASTCustomizableImporter`.
"
Class {
	#name : 'TSFASTContextEntry',
	#superclass : 'Object',
	#instVars : [
		'fastEntity',
		'tsNode',
		'field',
		'fmProperty'
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
