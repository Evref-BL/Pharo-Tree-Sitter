"
I am an abstract class to implement some visitors for a language to go over a collection of files, parse and visit them.

My subclasses can customize what I am doing by overriding #visitNode: 
"
Class {
	#name : 'TSAbstractFilesVisitor',
	#superclass : 'TSVisitor',
	#instVars : [
		'language',
		'extensions',
		'filesToParse',
		'code'
	],
	#category : 'TreeSitter-Spec',
	#package : 'TreeSitter-Spec'
}

{ #category : 'initialization' }
TSAbstractFilesVisitor >> buildOn: aFileReference [

	self collectFilesIn: aFileReference.

	filesToParse do: [ :file | self parseAndVisitFile: file ] displayingProgress: [ :file | file pathString ].

	self inspect
]

{ #category : 'initialization' }
TSAbstractFilesVisitor >> collectFilesIn: aFileReference [

	^ aFileReference isFile
		  ifTrue: [ (self extensions includes: aFileReference extension) ifTrue: [ filesToParse add: aFileReference ] ]
		  ifFalse: [ aFileReference children do: [ :child | self collectFilesIn: child ] ]
]

{ #category : 'accessing' }
TSAbstractFilesVisitor >> extensions [
	^ extensions
]

{ #category : 'accessing' }
TSAbstractFilesVisitor >> extensions: anObject [
	extensions := anObject
]

{ #category : 'initialization' }
TSAbstractFilesVisitor >> initialize [

	super initialize.
	filesToParse := OrderedCollection new
]

{ #category : 'accessing' }
TSAbstractFilesVisitor >> language [

	^ language
]

{ #category : 'accessing' }
TSAbstractFilesVisitor >> language: anObject [

	language := anObject
]

{ #category : 'initialization' }
TSAbstractFilesVisitor >> parseAndVisitFile: aFile [

	code := [ aFile contents ]
		        on: ZnInvalidUTF8
		        do: [ "For now we ignore files not in UTF8." '' ].

	((TSParser language: self language) parseString: code) rootNode accept: self
]
