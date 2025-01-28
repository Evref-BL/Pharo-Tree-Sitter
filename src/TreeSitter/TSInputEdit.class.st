Class {
	#name : 'TSInputEdit',
	#superclass : 'FFIStructure',
	#instVars : [
		'startByte',
		'oldEndByte',
		'newEndByte',
		'startPoint',
		'oldEndPoint',
		'newEndPoint'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'accessing' }
TSInputEdit >> newEndByte [

	^ newEndByte
]

{ #category : 'accessing' }
TSInputEdit >> newEndByte: anObject [

	newEndByte := anObject
]

{ #category : 'accessing' }
TSInputEdit >> newEndPoint [

	^ newEndPoint
]

{ #category : 'accessing' }
TSInputEdit >> newEndPoint: anObject [

	newEndPoint := anObject
]

{ #category : 'accessing' }
TSInputEdit >> oldEndByte [

	^ oldEndByte
]

{ #category : 'accessing' }
TSInputEdit >> oldEndByte: anObject [

	oldEndByte := anObject
]

{ #category : 'accessing' }
TSInputEdit >> oldEndPoint [

	^ oldEndPoint
]

{ #category : 'accessing' }
TSInputEdit >> oldEndPoint: anObject [

	oldEndPoint := anObject
]

{ #category : 'accessing' }
TSInputEdit >> startByte [

	^ startByte
]

{ #category : 'accessing' }
TSInputEdit >> startByte: anObject [

	startByte := anObject
]

{ #category : 'accessing' }
TSInputEdit >> startPoint [

	^ startPoint
]

{ #category : 'accessing' }
TSInputEdit >> startPoint: anObject [

	startPoint := anObject
]
