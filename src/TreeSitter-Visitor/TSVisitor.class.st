Class {
	#name : 'TSVisitor',
	#superclass : 'Object',
	#category : 'TreeSitter-Visitor',
	#package : 'TreeSitter-Visitor'
}

{ #category : 'visiting' }
TSVisitor >> visitNode: aTSNode [

	aTSNode collectNamedChild do: [ :child | child accept: self ]
]
