"
I am a little visitor used to see all the symbols present in a project and explore their children and parents.

You can use me like this: 

```st
	folder := FamixPythonBridge parsingExamples / 'project1'.

	TSSymbolsBuilderVisitor language: TSLanguage python extensions: #( 'py' ) buildOn: folder
```
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

{ #category : 'building - menus' }
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

{ #category : 'as yet unclassified' }
TSSymbolsBuilderVisitor >> symbolsInspector: aBuilder [

	<inspectorPresentationOrder: 50 title: 'Symbols explorer'>
	^ aBuilder instantiate: TSSymbolExplorerPresenter on: symbolDictionary
]

{ #category : 'visiting' }
TSSymbolsBuilderVisitor >> visitNode: aTSNode [

	aTSNode collectNamedChild do: [ :subNode | (symbolDictionary at: aTSNode type ifAbsentPut: [ Set new ]) add: subNode type ].
	super visitNode: aTSNode
]
