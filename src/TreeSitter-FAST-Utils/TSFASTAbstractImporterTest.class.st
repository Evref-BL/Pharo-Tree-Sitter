"
I am an abstract test case to help test FAST importers managed with TreeSitter. 

I have a system of stack used by `TSFASTImporterTestGenerator` and I provide a `#parse:` method to easily produce a model.

## Regression tests generation

I implement with `TSFASTImporterTestGeneration` a way to generate regression tests. 

In order to work, I need the importer to be able to handle the code to parse. If it works, I can give the piece of code to the generator and generate a test. 
The test builds a model and assert a lot of things based on Fame properties (the moose descriptions). 

For example I can do:

```st
code := 'yield from x'.
FASTPythonImporterTest generateTestNamed: 'yieldFrom' fromCode: code protocol: 'tests'.
```

And this will generate:

```st
testYieldFrom
	<generated>
	""Generated as regression test by FASTPyImporterTestGenerator>>#generateTestNamed:fromCode:protocol:
	Regenerate executing: 	self regenerateTest: #testYieldFrom 	""

	self parse: 'yield from x'.

	self assert: (fast allWithType: FASTPyIdentifier) size equals: 1.
	self assert: (fast allWithType: FASTPyModule) size equals: 1.
	self assert: (fast allWithType: FASTPyYield) size equals: 1.

	stack push: fast rootEntities anyOne containedEntities first.
	self assert: self topEntity sourceCode equals: 'yield from x'.
	self assert: (self topEntity isOfType: FASTPyYield).
	
	""Testing value of monovalue relation expression""
	self assert: self topEntity expression isNotNil.

		stack push: self topEntity expression.
		self assert: self topEntity sourceCode equals: 'x'.
		self assert: (self topEntity isOfType: FASTPyIdentifier)
```

### Customize the test generation

We can add hooks to the test generation. 

A first hook is here to define which traits we should verify. Sometimes we want to ensure a class has some traits (for example because they are used by FAST algos). In that case, we can add them to `TSFASTAbstractImporterTest>>#traitsToTest` by overriding the method. If an entity has one of the trait returned by this method, we will assert that the entities are using the trait. 

A second customization possible is about properties. 

By default, the test generator will test all properties that:
- Are not derived (derived properties should be tested in the FAST model, not in the importer)
- Are not defining a parent (Since we are testing children and relations are bidirectional, it is useless)
- Are not nil or returning an empty collection

It is also possible to reject some properties using `#propertiesToExclude`. By default, we reject `#startPos` and `#endPos`.

### Regenerate all tests

It is possible to regenerate all tests if the model had a big change using `#regenerateAllTests`. 
BUT BE CAREFUL! We should ALWAYS read each test that got modifier. NEVER commit regenerated code that you do not double check, else tests are useless.
"
Class {
	#name : 'TSFASTAbstractImporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'fast',
		'importer',
		'stack'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'test generation' }
TSFASTAbstractImporterTest class >> generateTestNamed: aString fromCode: code [

	^ self generateTestNamed: aString fromCode: code protocol: 'tests'
]

{ #category : 'test generation' }
TSFASTAbstractImporterTest class >> generateTestNamed: aString fromCode: code protocol: protocol [

	(TSFASTImporterTestGenerator testCase: self) generateTestNamed: aString fromCode: code protocol: protocol
]

{ #category : 'testing' }
TSFASTAbstractImporterTest class >> isAbstract [

	^ self = TSFASTAbstractImporterTest
]

{ #category : 'test generation' }
TSFASTAbstractImporterTest class >> propertiesToExclude [
	"Some properties to exclude from the tests."

	^ #( startPos endPos )
]

{ #category : 'test generation' }
TSFASTAbstractImporterTest class >> regenerateAllTests [

	<script>
	self methods
		select: [ :method | method hasPragmaNamed: #generated ]
		thenDo: [ :method | self regenerateTest: method selector ]
]

{ #category : 'test generation' }
TSFASTAbstractImporterTest class >> regenerateTest: aSymbol [

	(TSFASTImporterTestGenerator testCase: self) regenerateTest: self >> aSymbol
]

{ #category : 'test generation' }
TSFASTAbstractImporterTest class >> traitsToTest [
	"Return a collection of traits to test in generated tests. We provide some traits from FAST but you can customize those to test be overriding me."

	^ {
		  FASTTStatementBlock.
		  FASTTInvocation.
		  FASTTWithArguments.
		  FASTTLiteral.
		  FASTTNumericalLiteral.
		  FASTTWithParameters.
		  FASTTVariableEntity.
		  FASTTStringLiteral.
		  FASTTBinaryExpression.
		  FASTTWithCondition.
		  FASTTBooleanLiteral.
		  FASTTConditionalStatement.
		  FASTTComment.
		  FASTTReturnStatement.
		  FamixTHasImmediateSource.
		  FamixTSourceAnchor }
]

{ #category : 'running' }
TSFASTAbstractImporterTest >> importer [

	^ importer ifNil: [ importer := self importerClass new ]
]

{ #category : 'running' }
TSFASTAbstractImporterTest >> importerClass [

	^ self class environment at: (self class name withoutSuffix: 'Test') asSymbol
]

{ #category : 'running' }
TSFASTAbstractImporterTest >> parse: aString [

	^ fast := self importer
		          errorReportBlock: [ :i | i errors ifNotEmpty: [ self fail: 'Errors happened during parsing. Errors: ' , i errors printString ] ];
		          parse: aString withPlatformLineEndings
]

{ #category : 'running' }
TSFASTAbstractImporterTest >> setUp [

	super setUp.

	stack := Stack new
]
