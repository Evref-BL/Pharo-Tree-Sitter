Extension { #name : 'TSNode' }

{ #category : '*TreeSitter-Visitor' }
TSNode >> accept: aTSVisitor [

	^ aTSVisitor visitNode: self
]
