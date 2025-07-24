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
			selection selectedItem
				ifNil: [
						childrenTree roots: #(  ).
						parentsList items: #(  ) ]
				ifNotNil: [
						| parents |
						childrenTree
							roots: (symbolDictionary at: selection selectedItem);
							expandAll.

						parents := Set new.
						symbolDictionary keysAndValuesDo: [ :symbol :fields |
							(fields anySatisfy: [ :field | field symbols includes: selection selectedItem ]) ifTrue: [ parents add: symbol ] ].
						parentsList items: parents asOrderedCollection ] ].

	symbolList listPresenter selectFirst
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
TSSymbolExplorerPresenter >> initializeMenus [

	childrenTree actions: (SpActionGroup new
			 addActionWith: [ :anItem |
					 anItem
						 name: 'Copy filed items';
						 actionEnabled: [ childrenTree selectedItem class = TSFieldExplorerWrapper ];
						 action: [
							 Clipboard clipboardText: (String streamContents: [ :s | childrenTree selectedItem symbols do: [ :e | s nextPutAll: e ] separatedBy: [ s << ' / ' ] ]) ] ];
			 addActionWith: [ :anItem |
					 anItem
						 name: 'Copy All fields';
						 action: [
								 Clipboard clipboardText: (String streamContents: [ :s |
													  childrenTree roots
														  do: [ :field |
																  s << '- ' << field field << ': '.
																  field symbols do: [ :e | s nextPutAll: e ] separatedBy: [ s << ' / ' ] ]
														  separatedBy: [ s cr ] ]) ] ];
			 addActionWith: [ :anItem |
					 anItem
						 name: 'Inspect field items';
						 actionEnabled: [ childrenTree selectedItem class = TSFieldExplorerWrapper ];
						 action: [ childrenTree selectedItem symbols inspect ] ]).
	^ parentsList actions: (SpActionGroup new
			   addActionWith: [ :anItem |
					   anItem
						   name: 'Copy parents';
						   action: [ Clipboard clipboardText: (String streamContents: [ :s | parentsList items do: [ :e | s nextPutAll: e ] separatedBy: [ s << ' / ' ] ]) ] ];
			   addActionWith: [ :anItem |
					   anItem
						   name: 'Inspect list of parents';
						   action: [ parentsList items inspect ] ])
]

{ #category : 'initialization' }
TSSymbolExplorerPresenter >> initializePresenters [

	super initializePresenters.
	symbolList := self newFilteringList.
	childrenTree := self newTree.
	parentsList := self newFilteringList.

	symbolList
		items: symbolDictionary keys;
		sortingBlock: #yourself ascending.
	parentsList sortingBlock: #yourself ascending.

	childrenTree
		display: [ :item |
				item class = TSFieldExplorerWrapper
					ifTrue: [
							'Field: ' , item field , (item isOptional
									 ifTrue: [ ' (optional)' ]
									 ifFalse: [ '' ]) ]
					ifFalse: [ item ] ];
		children: [ :item |
				item class = TSFieldExplorerWrapper
					ifTrue: [ item symbols asOrderedCollection sort: #yourself ascending ]
					ifFalse: [ #(  ) ] ].

	self initializeMenus
]

{ #category : 'accessing - model' }
TSSymbolExplorerPresenter >> setModelBeforeInitialization: aDictionary [

	symbolDictionary := aDictionary
]
