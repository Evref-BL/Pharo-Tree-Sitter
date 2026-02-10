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
		'symbolDictionary',
		'code'
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
		do: [ :file |
				code := file contents.

				((TSParser language: self language) parseString: code) rootNode accept: self ]
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

	| fields |
	"This needs to be done here and not in the bloc for nodes that cannot have a child"
	fields := symbolDictionary
		          at: aTSNode type
		          ifPresent: [ :flds | "We check if some fields are missing in the current node to mark them as optional"
				          flds
					          reject: [ :field | aTSNode collectFieldNameOfNamedChild keys includes: field field ]
					          thenDo: [ :field | field isOptional: true ] ]
		          ifAbsentPut: [ OrderedCollection new ].

	aTSNode collectFieldNameOfNamedChild keysAndValuesDo: [ :field :nodes |
			| wrap |
			wrap := fields
				        detect: [ :wrapper | wrapper field = field ]
				        ifNone: [ fields add: (TSFieldExplorerWrapper field: field) ].

			wrap
				addAll: (nodes isCollection
						 ifTrue: [ nodes ]
						 ifFalse: [ { nodes } ])
				code: code ].
	super visitNode: aTSNode
]
