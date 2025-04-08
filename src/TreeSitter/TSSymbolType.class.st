Class {
	#name : 'TSSymbolType',
	#superclass : 'FFIEnumeration',
	#classVars : [
		'TSSymbolTypeAnonymous',
		'TSSymbolTypeAuxiliary',
		'TSSymbolTypeRegular',
		'TSSymbolTypeSupertype'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'enum declaration' }
TSSymbolType class >> buildEnumHierarchy [
	"This utility method will create a hierarchy based on enumDecl"
	<script>

	self buildClassVariables.
	self rebuildEnumHierarchyAccessors
]

{ #category : 'enum declaration' }
TSSymbolType class >> enumDecl [
	^ #(
	  TSSymbolTypeRegular 0
	  TSSymbolTypeAnonymous 1
	  TSSymbolTypeSupertype 2
     TSSymbolTypeAuxiliary 3
	)
]

{ #category : 'class initialization' }
TSSymbolType class >> initialize [
	self initializeEnumeration
]

{ #category : 'accessing enum' }
TSSymbolType class >> tssymboltypeanonymous [
	"This method was automatically generated"
	^ TSSymbolTypeAnonymous
]

{ #category : 'accessing enum' }
TSSymbolType class >> tssymboltypeauxiliary [
	"This method was automatically generated"
	^ TSSymbolTypeAuxiliary
]

{ #category : 'accessing enum' }
TSSymbolType class >> tssymboltyperegular [
	"This method was automatically generated"
	^ TSSymbolTypeRegular
]

{ #category : 'accessing enum' }
TSSymbolType class >> tssymboltypesupertype [
	"This method was automatically generated"
	^ TSSymbolTypeSupertype
]
