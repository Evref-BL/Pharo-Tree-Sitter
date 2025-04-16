Class {
	#name : 'TSLogCallback',
	#superclass : 'FFICallback',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'instance creation' }
TSLogCallback class >> fnSpec [
	^#(void (void *payload, TSLogType log_type, char *buffer))
]

{ #category : 'instance creation' }
TSLogCallback class >> on: aBlock [

	| aTSLogCallback |
	aTSLogCallback := self new.

	^ aTSLogCallback signature: self fnSpec block: aBlock
]
