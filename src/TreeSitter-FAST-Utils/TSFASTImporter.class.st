Class {
	#name : 'TSFASTImporter',
	#superclass : 'TSVisitor',
	#instVars : [
		'tsLanguage',
		'classesPrefix',
		'model',
		'originString'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'accessing' }
TSFASTImporter >> classesPrefix [

	^ classesPrefix
]

{ #category : 'accessing' }
TSFASTImporter >> import: aTSNode [

	| rootFastEntity |
	model := (self classesPrefix , 'Model' asClassInEnvironment: self class environment) new.
	rootFastEntity := aTSNode accept: self.
	rootFastEntity source: self originString.
	^ model
]

{ #category : 'accessing' }
TSFASTImporter >> instantiateFastEntityFrom: aTSNode [

	| fast children |
	fast := [ self newInstanceOfClassNamed: self classesPrefix , aTSNode type capitalized ]
		        on: Error
		        do: [ self newInstanceOfClassNamed: self classesPrefix , aTSNode type pascalized ].

	children := aTSNode collectFieldNameOfNamedChild.
	children keysDo: [ :key |
			key = '<unnamedChild>' ifFalse: [
					(fast class methodDict keys select: [ :e | e = key asSymbol ]) ifNotEmpty: [
						fast perform: key asSymbol asMutator with: (self instantiateFastEntityFrom: (children at: key)) ] ] ].
	^ fast
]

{ #category : 'accessing' }
TSFASTImporter >> languageName: aString [

	classesPrefix := 'FAST' , aString
]

{ #category : 'accessing' }
TSFASTImporter >> newInstanceOfClassNamed: aString [

	^ (aString asClassInEnvironment: self class environment) new
]

{ #category : 'accessing' }
TSFASTImporter >> originString [

	^ originString
]

{ #category : 'accessing' }
TSFASTImporter >> originString: anObject [

	originString := anObject
]

{ #category : 'accessing' }
TSFASTImporter >> tsLanguage [

	^ tsLanguage
]

{ #category : 'accessing' }
TSFASTImporter >> tsLanguage: anObject [

	tsLanguage := anObject
]

{ #category : 'visiting' }
TSFASTImporter >> visitNode: aTSNode [

	| fastEntity |
	fastEntity := self instantiateFastEntityFrom: aTSNode.
	model add: fastEntity.
	1 to: aTSNode namedChildCount do: [ :idx |
		| childFast fieldName tsNode |
		tsNode := aTSNode namedChildAt: idx.
		fieldName := aTSNode fieldNameOfChildNamedAt: idx.
		childFast := tsNode accept: self.
		fieldName
			ifEmpty: [ fastEntity addGenericChildren: childFast ]
			ifNotEmpty: [
				[
				fastEntity
					perform:  fieldName asSymbol asMutator 
					with: childFast ]
					on: Error
					do: [ :error | fastEntity addGenericChildren: childFast ] ] ].
	fastEntity startPos:
		(self originString positionFromTSPoint: aTSNode startPoint) + 1.
	fastEntity endPos:
		(self originString positionFromTSPoint: aTSNode endPoint).
	^ fastEntity
]
