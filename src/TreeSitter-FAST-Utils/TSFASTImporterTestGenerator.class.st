"
I am a test generator for FAST importers. 

The user should not use me directly but via `TSFASTAstractImporterTest` and its subclasses. 

I will take as input:
- The test class 
- A piece of code
- A protocol

And I will generate a test that builds the FAST model and test each entity of the model and its properties. 

The model should have only 1 root entity (an entity without parent) because I there should not be models with multiple roots. 

The test case can configure some things to influence my output. For example it can define a list of traits and I will test that the entities have the traits in their trait composition or some properties to not test.

WARNING!

In order to work, the test generator needs a working importer. I generate regression tests and I cannot be used as TDD.  
"
Class {
	#name : 'TSFASTImporterTestGenerator',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'indentation',
		'stream'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'tests' }
TSFASTImporterTestGenerator class >> testCase: aClass [

	^ self new
		  testCase: aClass;
		  yourself
]

{ #category : 'test generation' }
TSFASTImporterTestGenerator >> assertTraitsOf: entity [

	(entity class usedStatefulTraits intersection: self testCase traitsToTest) ifNotEmpty: [ :traits |
			stream
				nextPutAll: ').';
				cr;
				tab: indentation.
			(traits sorted: #name ascending)
				do: [ :trait |
						stream
							nextPutAll: 'self assert: (self topEntity isOfType: ';
							nextPutAll: trait name ]
				separatedBy: [
						stream
							nextPutAll: ').';
							cr;
							tab: indentation ] ]
]

{ #category : 'test generation' }
TSFASTImporterTestGenerator >> generateAssertionsFor: entity pushing: pushString popAtTheEnd: shouldPop [

	| propertiesToAssert |
	indentation := indentation + 1.

	propertiesToAssert := entity mooseDescription allProperties select: [ :property | self shouldSelectProperty: property of: entity ]. "Sorting properties in order to always have the same order."
	propertiesToAssert sort: #name ascending.

	stream
		cr;
		tab: indentation;
		nextPutAll: 'stack push: ';
		nextPutAll: pushString;
		nextPutAll: '.';
		cr;
		tab: indentation;
		nextPutAll: 'self assert: self topEntity sourceCode equals: ';
		print: entity sourceCode withInternalLineEndings;
		nextPutAll: (entity sourceCode lines size > 1
				 ifTrue: [ ' withPlatformLineEndings.' ]
				 ifFalse: [ '.' ]);
		cr;
		tab: indentation;
		nextPutAll: 'self assert: (self topEntity isOfType: ';
		nextPutAll: entity class name.
		
	self assertTraitsOf: entity.


	(shouldPop not and: [ propertiesToAssert isEmpty ])
		ifTrue: [ stream nextPut: $) ]
		ifFalse: [
				stream
					nextPutAll: ').';
					cr;
					tab: indentation ].

	propertiesToAssert do: [ :property |
			| result selector skipPop |
			result := property getRawFrom: entity.
			selector := property implementingSelector.
			skipPop := shouldPop not and: [ property = propertiesToAssert last ].
			(property isMultivalued and: [ property type isPrimitive not ])
				ifTrue: [
						result ifNotEmpty: [
								stream
									cr;
									tab: indentation;
									nextPutAll: '"Testing value of multivalued relation ';
									nextPutAll: selector;
									nextPutAll: '"';
									cr;
									tab: indentation;
									nextPutAll: 'self assert: self topEntity ';
									nextPutAll: selector;
									nextPutAll: ' size equals: ';
									print: result size;
									nextPut: $.;
									cr;
									tab: indentation.
								result doWithIndex: [ :child :index |
									self
										generateAssertionsFor: child
										pushing: '(stack top ' , selector , ' at: ' , index asString , ')'
										popAtTheEnd: (skipPop not or: [ result size ~= index ]) ] ] ]
				ifFalse: [ "When we have a relation to a collection of entities we do recursively do the testing."
						(result isMooseObject and: [ result isMooseEntity ])
							ifTrue: [
									stream
										cr;
										tab: indentation;
										nextPutAll: '"Testing value of monovalue relation ';
										nextPutAll: selector;
										nextPutAll: '"';
										cr;
										tab: indentation;
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' isNotNil.';
										cr.
									self generateAssertionsFor: result pushing: 'self topEntity ' , selector popAtTheEnd: skipPop not ]
							ifFalse: [
									stream
										nextPutAll: 'self assert: self topEntity ';
										nextPutAll: selector;
										nextPutAll: ' equals: ';
										store: result.
									(result isString and: [ result lines size > 1 ]) ifTrue: [ stream nextPutAll: ' withPlatformLineEndings' ].
									skipPop ifFalse: [
											stream
												nextPut: $.;
												cr;
												tab: indentation ] ] ] ].

	indentation := indentation - 1.
	shouldPop ifTrue: [
			stream
				nextPutAll: 'stack pop.';
				cr;
				tab: indentation ].
]

{ #category : 'test generation' }
TSFASTImporterTestGenerator >> generateMethod: aString inProtocol: protocol [

	self testCase
		compiledMethodAt: aString lines first asSymbol
		ifPresent: [ :method |(method protocolName = protocol and: [ method sourceCode = aString ]) ifTrue: [ ^ self "No need to recompile here." ] ].

	self testCase compile: stream contents classified: protocol
]

{ #category : 'test generation' }
TSFASTImporterTestGenerator >> generateTestNamed: aString fromCode: code protocol: protocol [

	| model methodName |
	model := self testCase new parse: code withPlatformLineEndings.
	methodName := ('test' , aString capitalized) asSymbol.

	stream
		nextPutAll: methodName;
		cr;
		tab;
		nextPutAll: '<generated>';
		cr;
		tab;
		nextPutAll: '"Generated as regression test by ';
		print: thisContext homeMethod;
		cr;
		tab;
		nextPutAll: 'Regenerate executing: 	self regenerateTest: ';
		print: methodName;
		nextPutAll: ' 	"';
		cr;
		cr;
		tab;
		nextPutAll: 'self parse: ';
		print: code;
		nextPut: $.;
		cr;
		cr.

	(model allEntityTypes sorted: #class ascending) do: [ :type |
			stream
				tab;
				nextPutAll: 'self assert: (fast allWithType: ';
				print: type;
				nextPutAll: ') size equals: ';
				print: (model allWithType: type) size;
				nextPut: $.;
				cr ].

	model rootEntities size = 1 ifFalse: [ self error: 'FAST generator was thought with only 1 top entity?' ].
	
	"If we have only one entity in the root entity, we test it directly and we don't test the root entity since it will be tested by other tests in general.
	If we have multiple children we test the root entity."
	model rootEntities anyOne containedEntities size = 1
		ifTrue: [ self generateAssertionsFor: model rootEntities anyOne containedEntities first pushing: 'fast rootEntities anyOne containedEntities first' popAtTheEnd: false ]
		ifFalse: [ self generateAssertionsFor: model rootEntities anyOne pushing: 'fast rootEntities anyOne' popAtTheEnd: false ].

	self generateMethod:  stream contents inProtocol: protocol
]

{ #category : 'initialization' }
TSFASTImporterTestGenerator >> initialize [

	super initialize.
	indentation := 0.
	stream := '' writeStream
]

{ #category : 'test generation' }
TSFASTImporterTestGenerator >> regenerateTest: aCompiledMethod [

	| sourceCode |
	sourceCode := aCompiledMethod ast statements first arguments first value.

	self generateTestNamed: (aCompiledMethod selector withoutPrefix: 'test') fromCode: sourceCode protocol: aCompiledMethod protocol
]

{ #category : 'asserting' }
TSFASTImporterTestGenerator >> shouldSelectProperty: property of: entity [

	(self testCase propertiesToExclude includes: property implementingSelector) ifTrue: [ ^ false ].
	
	property isChildrenProperty ifTrue: [ ^  (property getFrom: entity) isEmptyOrNil not ].

	property isDerived ifTrue: [ ^ false ]. "No need to check derived properties since they can be recomputed. I am not the place to test general mecanisms"

	property isContainer ifTrue: [ ^ false ]. "We check from top to bottom. Not need to tests relations in both ways."

	^ (property getFrom: entity) isEmptyOrNil not
]

{ #category : 'accessing' }
TSFASTImporterTestGenerator >> testCase [
	^ testCase
]

{ #category : 'accessing' }
TSFASTImporterTestGenerator >> testCase: anObject [
	testCase := anObject
]
