Class {
	#name : 'TSNullPointerException',
	#superclass : 'Error',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'accessing' }
TSNullPointerException >> messageText [

	^ messageText ifNil: [
		  messageText := 'Be carreful! we avoid you a null pointer exception that kill the image' ]
]
