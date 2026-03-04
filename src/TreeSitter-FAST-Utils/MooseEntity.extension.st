Extension { #name : 'MooseEntity' }

{ #category : '*TreeSitter-FAST-Utils' }
MooseEntity >> addGenericChild: anObject [
	"This is just for compatibility during the time we regenerate all FAST models based on TreeSitter. To remove later."

	self deprecated: 'The Metamodel needs to be regenerated in order to generate the right #addGenericChild: method on the fast entities.'.
	^ self addGenericChildren: anObject
]
