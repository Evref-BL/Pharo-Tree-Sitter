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
	#superclass : 'TSAbstractFilesVisitor',
	#instVars : [
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
TSSymbolsBuilderVisitor >> initialize [

	super initialize.
	symbolDictionary := Dictionary new
]

{ #category : 'inspector' }
TSSymbolsBuilderVisitor >> symbolsInspector: aBuilder [

	<inspectorPresentationOrder: 50 title: 'Symbols explorer'>
	^ aBuilder instantiate: TSSymbolExplorerPresenter on: symbolDictionary
]

{ #category : 'visiting' }
TSSymbolsBuilderVisitor >> visitNode: aTSNode [

	| fields childrenMap |
	"This needs to be done here and not in the bloc for nodes that cannot have a child"
	childrenMap := aTSNode collectFieldNameOfNamedChild. "Saving it to save time in FFI calls"
	fields := symbolDictionary
		          at: aTSNode type
		          ifPresent: [ :flds | "We check if some fields are missing in the current node to mark them as optional, meaning the minimal number of nodes for this field can be 0"
				          flds
					          reject: [ :field | childrenMap keys includes: field field ]
					          thenDo: [ :field | field isOptional: true ] ]
		          ifAbsentPut: [ OrderedCollection new ].

	childrenMap keysAndValuesDo: [ :field :nodes |
			| wrap |
			wrap := fields
				        detect: [ :wrapper | wrapper field = field ]
				        ifNone: [ fields add: (TSFieldExplorerWrapper field: field) ].

			wrap addAll: nodes asTSNodes code: code ].
	super visitNode: aTSNode
]
