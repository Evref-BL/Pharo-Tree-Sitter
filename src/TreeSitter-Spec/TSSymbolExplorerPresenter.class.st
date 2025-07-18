"
I am a presenter used by `TSSymbolExplorerPresenter` to display its result in the inspector.
"
Class {
	#name : 'TSSymbolExplorerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'symbolDictionary',
		'symbolList',
		'parentsList',
		'childrenList'
	],
	#category : 'TreeSitter-Spec',
	#package : 'TreeSitter-Spec'
}

{ #category : 'initialization' }
TSSymbolExplorerPresenter >> connectPresenters [

	super connectPresenters.

	symbolList whenSelectionChangedDo: [ :selection |
			| parents |
			parents := Set new.
			symbolDictionary keysAndValuesDo: [ :symbol :children | (children includes: symbol) ifTrue: [ parents add: symbol ] ].
			childrenList items: (symbolDictionary at: selection selectedItem) asOrderedCollection.
			parentsList items: parents asOrderedCollection ].

	symbolList selectFirst
]

{ #category : 'layout' }
TSSymbolExplorerPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  spacing: 3;
		  add: (SpBoxLayout newTopToBottom
				   add: 'Symbols' expand: false;
				   add: symbolList);
		  add: (SpBoxLayout newTopToBottom
				   add: 'Possible children' expand: false;
				   add: childrenList);
		  add: (SpBoxLayout newTopToBottom
				   add: 'Possible parents' expand: false;
				   add: parentsList);
		  yourself
]

{ #category : 'initialization' }
TSSymbolExplorerPresenter >> initializePresenters [

	super initializePresenters.

	symbolList := self newList.
	childrenList := self newList.
	parentsList := self newList.

	symbolList items: symbolDictionary keys
]

{ #category : 'accessing - model' }
TSSymbolExplorerPresenter >> setModelBeforeInitialization: aDictionary [

	symbolDictionary := aDictionary
]
