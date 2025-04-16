Class {
	#name : 'TSLogger',
	#superclass : 'FFIStructure',
	#classVars : [
		'OFFSET_LOG',
		'OFFSET_PAYLOAD'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'field definition' }
TSLogger class >> fieldsDesc [
	^ #(
  void * payload;
  TSLogCallback * log ;
	)
]

{ #category : 'accessing - structure variables' }
TSLogger >> log [
	"This method was automatically generated"
	^TSLogCallback forAddress: ((handle pointerAt: OFFSET_LOG) asInteger)
]

{ #category : 'accessing - structure variables' }
TSLogger >> log: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_LOG
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
TSLogger >> payload [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PAYLOAD) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
TSLogger >> payload: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PAYLOAD put: anObject getHandle.
]
