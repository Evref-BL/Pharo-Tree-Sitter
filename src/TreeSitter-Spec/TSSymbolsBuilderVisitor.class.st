"
I am a little visitor used to see all the symbols present in a project and explore their children and parents.

You can use me like this: 

```st
	folder := '/resources/examples/project1' asFileReference.

	TSSymbolsBuilderVisitor language: TSLanguage python extensions: #( 'py' ) buildOn: folder
```

Warning: This visitor will build a map of all the symbols present in a project and the nodes in which they can be and the node types they can contain. But this will just represent what is present in a particular project, not all the possibilities in the language. So run me on the biggest source of code possible to have the maximum of possibilities covered.
"
Class {
	#name : 'TSSymbolsBuilderVisitor',
	#superclass : 'TSVisitor',
	#instVars : [
		'language',
		'extensions',
		'filesToParse',
		'symbolDictionary'
	],
	#category : 'TreeSitter-Spec',
	#package : 'TreeSitter-Spec'
}

{ #category : 'instance creation' }
TSSymbolsBuilderVisitor class >> language: aTSLanguage extensions: aCollection buildOn: aFileReference [

	^ self new
		  language: aTSLanguage;
		  extensions: aCollection;
		  buildOn: aFileReference
]

{ #category : 'initialization' }
TSSymbolsBuilderVisitor >> buildOn: aFileReference [

	self collectFilesIn: aFileReference.

	filesToParse
		do: [ :file | ((TSParser language: self language) parseString: file contents) rootNode accept: self ]
		displayingProgress: [ :file | file pathString ].
		
	self inspect
]

{ #category : 'initialization' }
TSSymbolsBuilderVisitor >> collectFilesIn: aFileReference [

	^ aFileReference isFile
		  ifTrue: [ (self extensions includes: aFileReference extension) ifTrue: [ filesToParse add: aFileReference ] ]
		  ifFalse: [ aFileReference children do: [ :child | self collectFilesIn: child ] ]
]

{ #category : 'accessing' }
TSSymbolsBuilderVisitor >> extensions [
	^ extensions
]

{ #category : 'accessing' }
TSSymbolsBuilderVisitor >> extensions: anObject [
	extensions := anObject
]

{ #category : 'initialization' }
TSSymbolsBuilderVisitor >> initialize [

	super initialize.
	filesToParse := OrderedCollection new.
	symbolDictionary := Dictionary new
]

{ #category : 'accessing' }
TSSymbolsBuilderVisitor >> language [

	^ language
]

{ #category : 'accessing' }
TSSymbolsBuilderVisitor >> language: anObject [

	language := anObject
]

{ #category : 'inspector' }
TSSymbolsBuilderVisitor >> symbolsInspector: aBuilder [

	<inspectorPresentationOrder: 50 title: 'Symbols explorer'>
	^ aBuilder instantiate: TSSymbolExplorerPresenter on: symbolDictionary
]

{ #category : 'visiting' }
TSSymbolsBuilderVisitor >> visitNode: aTSNode [

	aTSNode collectFieldNameOfNamedChild keysAndValuesDo: [ :field :nodes |
			| fields wrap |
			fields := symbolDictionary at: aTSNode type ifAbsentPut: [ OrderedCollection new ].
			wrap := fields
				        detect: [ :wrapper | wrapper field = field ]
				        ifNone: [ fields add: (TSFieldExplorerWrapper field: field) ].

			wrap addAll: (nodes isCollection
					 ifTrue: [ nodes collect: #type ]
					 ifFalse: [ { nodes type } ]) ].
	super visitNode: aTSNode
]
