"
I am responsible for encoding the strings as it is supported by treeSitter.
Below is how you can use me:

```
parser := TSParser new.
typescriptLanguage := TSLanguage typescript.
parser language: typescriptLanguage.

string := 't = stréàè.toString();'.

res := parser parseString: string usingTree: ExternalAddress null encoding: TSInputEncoding tsinputencodingutf8 .
root := res rootNode .
```
"
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
