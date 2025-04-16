Class {
	#name : 'TSLogType',
	#superclass : 'FFIEnumeration',
	#classVars : [
		'TSLogTypeLex',
		'TSLogTypeParse'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'enum declaration' }
TSLogType class >> buildEnumHierarchy [
	"This utility method will create a hierarchy based on enumDecl"
	<script>

	self buildClassVariables.
	self rebuildEnumHierarchyAccessors
]

{ #category : 'enum declaration' }
TSLogType class >> enumDecl [
	^ #(
	  TSLogTypeParse 0
	  TSLogTypeLex 1
	)
]

{ #category : 'enum declaration' }
TSLogType class >> initialize [
	self initializeEnumeration
]
