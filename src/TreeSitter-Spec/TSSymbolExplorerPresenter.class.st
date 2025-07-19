"
I am a presenter used by `TSSymbolExplorerPresenter` to display its result in the inspector.

I display the list of symbols present in the project. And when one is selected I show two other panes:
- A tree with all the fields that the symbol can have and their possible contents
- A list of possible symbols that can be the parents of this symbol
"
Class {
	#name : 'TSSymbolExplorerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'symbolDictionary',
		'symbolList',
		'parentsList',
		'childrenTree'
	],
	#category : 'TreeSitter-Spec',
	#package : 'TreeSitter-Spec'
}

{ #category : 'initialization' }
TSSymbolExplorerPresenter >> connectPresenters [

	super connectPresenters.

	symbolList whenSelectionChangedDo: [ :selection |
			| parents |
			childrenTree
				roots: (symbolDictionary at: selection selectedItem);
				expandAll.

			parents := Set new.
			symbolDictionary keysAndValuesDo: [ :symbol :fields |
				(fields anySatisfy: [ :field | field symbols includes: selection selectedItem ]) ifTrue: [ parents add: symbol ] ].
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
				   add: 'Possible children by fields' expand: false;
				   add: childrenTree);
		  add: (SpBoxLayout newTopToBottom
				   add: 'Possible parents' expand: false;
				   add: parentsList);
		  yourself
]

{ #category : 'initialization' }
TSSymbolExplorerPresenter >> initializePresenters [

	super initializePresenters.

	symbolList := self newList.
	childrenTree := self newTree.
	parentsList := self newList.

	symbolList
		items: symbolDictionary keys;
		sortingBlock: #yourself ascending.

	childrenTree display: [ :item |
			item class = TSFieldExplorerWrapper
				ifTrue: [
						'Field: ' , item field , (item isOptional
							 ifTrue: [ ' (optional)' ]
							 ifFalse: [ '' ]) ]
				ifFalse: [ item ] ].

	childrenTree children: [ :item |
			item class = TSFieldExplorerWrapper
				ifTrue: [ item symbols asOrderedCollection ]
				ifFalse: [ #(  ) ] ]
]

{ #category : 'accessing - model' }
TSSymbolExplorerPresenter >> setModelBeforeInitialization: aDictionary [

	symbolDictionary := aDictionary
]
