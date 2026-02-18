"
I am aa FAST importer whose goal is to be customizable in order to tweak the FAST model produced and not have a 1-1 mapping.

I can be subclassed for a specific language.
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

{ #category : 'visiting' }
TSFASTCustomizableImporter >> visitNode: aTSNode [
	"Here we are performing a special visit method. If it is not implemented the #doesNotUnderstood: will call my super visitNode:. The reason we are doing this is to simplify the debugging of a visitor to not have to step over a lot of method calls..."

	^ self perform: (self buildVisitMethodNameFor: aTSNode) with: aTSNode
]
