"
I remember what an importer needs to reparse the source of a FAST model incrementally: the source the model was built from, the tree-sitter tree of that source and the FAST model built from it. A TSFASTAbstractImporter keeps one of me per model it answers (see #parse:usingOldTree:).
"
Class {
	#name : 'TSFASTTreeRepresentation',
	#superclass : 'Object',
	#instVars : [
		'source',
		'treeSitterTree',
		'fastModel'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'accessing' }
TSFASTTreeRepresentation >> fastModel [

	^ fastModel
]

{ #category : 'accessing' }
TSFASTTreeRepresentation >> fastModel: anObject [

	fastModel := anObject
]

{ #category : 'accessing' }
TSFASTTreeRepresentation >> source [

	^ source
]

{ #category : 'accessing' }
TSFASTTreeRepresentation >> source: anObject [

	source := anObject
]

{ #category : 'accessing' }
TSFASTTreeRepresentation >> treeSitterTree [

	^ treeSitterTree
]

{ #category : 'accessing' }
TSFASTTreeRepresentation >> treeSitterTree: anObject [

	treeSitterTree := anObject
]
