Class {
	#name : 'TSFASTImporter',
	#superclass : 'TSVisitor',
	#instVars : [
		'tsLanguage',
		'languageName',
		'model',
		'originString'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'filling' }
TSFASTImporter >> fillSource: aTextSource [ 

[((model allWithSubTypesOfAny: {
			  "FASTTypescriptClass_declaration.
			  FASTTypescriptInterface_declaration.
			  FASTTypescriptEnum_declaration"
				FASTTypescriptProgram.
			 }) detect: [ :aDeclaration | aDeclaration parentNode isNil ]) source: aTextSource ]
		on: Error
		do: [ :err |
			('FAST Err parsing: ' , String crlf , aTextSource) record.
			err signal ].
]

{ #category : 'accessing' }
TSFASTImporter >> import: aTSNode [

	| rootFastEntity |
	model := ('FAST' , self languageName , 'Model' asClassInEnvironment:
		          self class environment) new.
	rootFastEntity := aTSNode accept: self.
	"rootFastEntity source: self originString."
	self fillSource: self originString .
	^ model
]

{ #category : 'accessing' }
TSFASTImporter >> instantiateFastEntityFrom: aTSNode [

	^ ('FAST' , self languageName , aTSNode type capitalized
		   asClassInEnvironment: self class environment) new
]

{ #category : 'accessing' }
TSFASTImporter >> languageName [

	^ languageName
]

{ #category : 'accessing' }
TSFASTImporter >> languageName: anObject [

	languageName := anObject
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
			(fastEntity perform: fieldName asSymbol) add: childFast ] ].
	fastEntity startPos:
		(self originString positionFromTSPoint: aTSNode startPoint) + 1.
	fastEntity endPos:
		(self originString positionFromTSPoint: aTSNode endPoint).
	^ fastEntity
]
