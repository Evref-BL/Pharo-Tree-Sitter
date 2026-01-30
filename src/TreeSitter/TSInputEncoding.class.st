Class {
	#name : 'TSInputEncoding',
	#superclass : 'FFIEnumeration',
	#classVars : [
		'TSInputEncodingCustom',
		'TSInputEncodingUTF16BE',
		'TSInputEncodingUTF16LE',
		'TSInputEncodingUTF8'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'utilities' }
TSInputEncoding class >> buildEnumHierarchy [
	"This utility method will create a hierarchy based on enumDecl"
	<script>

	self buildClassVariables.
	self rebuildEnumHierarchyAccessors
]

{ #category : 'enum declaration' }
TSInputEncoding class >> enumDecl [
	^ #(
	  TSInputEncodingUTF8 0
	  TSInputEncodingUTF16LE 1
	  TSInputEncodingUTF16BE 2
     TSInputEncodingCustom 3
	)
]

{ #category : 'class initialization' }
TSInputEncoding class >> initialize [
	self initializeEnumeration
]

{ #category : 'as yet unclassified' }
TSInputEncoding class >> tsinputencodingcustom [

^ TSInputEncodingCustom
]

{ #category : 'as yet unclassified' }
TSInputEncoding class >> tsinputencodingutf16be [

^ TSInputEncodingUTF16BE
]

{ #category : 'as yet unclassified' }
TSInputEncoding class >> tsinputencodingutf16le [

^ TSInputEncodingUTF16LE
]

{ #category : 'as yet unclassified' }
TSInputEncoding class >> tsinputencodingutf8 [

^ TSInputEncodingUTF8
]
