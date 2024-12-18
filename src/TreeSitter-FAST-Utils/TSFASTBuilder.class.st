"
I build a FAST metamodel generator based on a tree sitter language
"
Class {
	#name : 'TSFASTBuilder',
	#superclass : 'Object',
	#instVars : [
		'tsLanguage'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'building' }
TSFASTBuilder >> addDefineClassIn: metamodelGeneratorClass [

	| method |
	method := String streamContents: [ :stream |
		          stream << 'defineClasses

'.

		          self typesToReify
			          do: [ :type |
				          stream
					          << '	';
					          << (self variableNameOfTSSymbol: type);
					          << ' := '.
				          stream << 'self newClassNamed: #'
				          << (tsLanguage nameOfSymbol: type) capitalized << '.' ]
			          separatedBy: [
				          stream << '
' ] ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addPackageNameMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'packageName

	^ #''FASTPython-Model'''
		classified: #accessing
]

{ #category : 'building' }
TSFASTBuilder >> addPrefixMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'prefix

	^ #FASTPython'
		classified: #accessing
]

{ #category : 'api' }
TSFASTBuilder >> build [

	| metamodelGeneratorClass |
	metamodelGeneratorClass := self createMetamodelGeneratorClass.
	self addPrefixMethodIn: metamodelGeneratorClass.
	self addPackageNameMethodIn: metamodelGeneratorClass.
	self addDefineClassIn: metamodelGeneratorClass
]

{ #category : 'building' }
TSFASTBuilder >> createMetamodelGeneratorClass [

	| classBuilder className |
	className := #FASTPython.
	classBuilder := FamixMetamodelGenerator
	                << (className , #MetamodelGenerator).
	classBuilder slots: (self typesToReify collect: [ :type |
			 (self variableNameOfTSSymbol: type) asSymbol ] as: Set).
	classBuilder package: className , #'-Model-Generator'.
	^ classBuilder install
]

{ #category : 'accessing' }
TSFASTBuilder >> tsLanguage [

	^ tsLanguage
]

{ #category : 'accessing' }
TSFASTBuilder >> tsLanguage: anObject [

	tsLanguage := anObject
]

{ #category : 'building' }
TSFASTBuilder >> typesToReify [

	^ tsLanguage symbolsOfType: TSSymbolType tssymboltyperegular
]

{ #category : 'building' }
TSFASTBuilder >> variableNameOfTSSymbol: aTSSymbol [

	^ '_', (tsLanguage nameOfSymbol: aTSSymbol)
]
