"
A TSNullPointerExceptionTest is a test class for testing the behavior of TSNullPointerException
"
Class {
	#name : 'TSNullPointerExceptionTest',
	#superclass : 'TestCase',
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'tests' }
TSNullPointerExceptionTest >> testMessageText [

	[
		TSNullPointerException signal.
		self fail: 'The exception was not signaled'.
	] on: TSNullPointerException do: [ :e |
		self assert: e messageText isNotEmpty 
	]
]
