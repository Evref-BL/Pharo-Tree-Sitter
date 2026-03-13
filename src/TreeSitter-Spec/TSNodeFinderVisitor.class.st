"
I am a visitor made to find a node in a folder of surces matching a certain pattern and see the source code associated.

For example, I wanted to find an example of code with a except_clause in python that had multiple children in the #value field:

```st
folder := '/Users/cyril/testPython/cpython-main' asFileReference.

TSNodeFinderVisitor
	language: TSLanguage python
	extensions: #( 'py' )
	selection: [ :node | node type = #except_clause and: [ (node detectChildWithFieldName: #value) isCollection ] ]
	buildOn: folder
```

Note that in order for me to work, I need to have a matching node in the sources provided.

I'll save the found node in my node ivar.
"
Class {
	#name : 'TSNodeFinderVisitor',
	#superclass : 'TSAbstractFilesVisitor',
	#instVars : [
		'selectionBlock',
		'node'
	],
	#category : 'TreeSitter-Spec',
	#package : 'TreeSitter-Spec'
}

{ #category : 'as yet unclassified' }
TSNodeFinderVisitor class >> language: aTSLanguage extensions: aCollection selection: aBlock buildOn: aFileReference [

	^ self new
		  language: aTSLanguage;
		  extensions: aCollection;
		  selectionBlock: aBlock;
		  buildOn: aFileReference
]

{ #category : 'inspector' }
TSNodeFinderVisitor >> inspectionFullSource: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Full sourceText'>
	^ aBuilder newCode
		  withoutSyntaxHighlight;
		  withLineNumbers;
		  text: code;
		  addTextSegmentDecoration: (SpTextPresenterDecorator forHighlight
				   interval: ((node startPositionFromSourceText: code) to: (node endPositionFromSourceText: code) + 1);
				   yourself);
		  beNotEditable
]

{ #category : 'inspector' }
TSNodeFinderVisitor >> inspectionFullSourceContext: aContext [

	aContext active: node isNotNil
]

{ #category : 'inspector' }
TSNodeFinderVisitor >> inspectionSource: aBuilder [

	<inspectorPresentationOrder: 4 title: 'SourceText'>
	^ aBuilder newCode
		  withoutSyntaxHighlight;
		  withLineNumbers;
		  text: (node
				   ifNil: [ 'No node matched.' ]
				   ifNotNil: [ node textFromSourceText: code ]);
		  beNotEditable
]

{ #category : 'accessing' }
TSNodeFinderVisitor >> selectionBlock: anObject [
	selectionBlock := anObject
]

{ #category : 'visiting' }
TSNodeFinderVisitor >> visitNode: aTSNode [

	(selectionBlock value: aTSNode) ifTrue: [
			node := aTSNode.
			^ self ].

	super visitNode: aTSNode
]
