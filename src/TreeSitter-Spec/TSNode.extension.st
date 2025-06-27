Extension { #name : 'TSNode' }

{ #category : '*TreeSitter-Spec' }
TSNode >> tsTreeExtension: aBuilder [

	<inspectorPresentationOrder: 15 title: 'TS Tree'>
	^ aBuilder newTreeTable
		  addColumn: (SpCompositeTableColumn new
				   addColumn: (SpStringTableColumn evaluated: #type);
				   yourself);
		  children: [ :aTSNode |
				  (1 to: aTSNode namedChildCount) collect: [ :idx |
					  aTSNode namedChildAt: idx ] ];
		  roots: { self };
		  beResizable;
		  yourself
]
