Class {
	#name : 'TSParserJavaTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'javaLanguage'
	],
	#category : 'TreeSitter-Java-Tests',
	#package : 'TreeSitter-Java-Tests'
}

{ #category : 'running' }
TSParserJavaTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	javaLanguage := TSLanguage java.
	parser language: javaLanguage
]

{ #category : 'running' }
TSParserJavaTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserJavaTest >> testPositionEndPointInString [

	| string tree |
	
	string := ' public static void main(String[] args) {
    Main myObj = new Main();
    System.out.println(myObj.x);
  }' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first endPoint)
		equals: 107
]

{ #category : 'tests' }
TSParserJavaTest >> testPositionInString [

	| string tree |
	
	string := ' public static void main(String[] args) {
    Main myObj = new Main();
    System.out.println(myObj.x);
  }' withPlatformLineEndings.

	tree := parser parseString: string.
	self
		assert: (string positionFromTSPoint:
				 tree rootNode namedChildren first namedChildren second startPoint)
		equals: 15
]

{ #category : 'tests' }
TSParserJavaTest >> testRootNodeSymbolSimpleJavaClass [

	| string tree |
	
	string := ' public static void main(String[] args) {
    Main myObj = new Main();
    System.out.println(myObj.x);
  }' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode symbol equals: 138
]

{ #category : 'tests' }
TSParserJavaTest >> testRootOfSimpleJavaClasstHasOneChild [

	| string tree |
	
	string := ' public static void main(String[] args) {
    Main myObj = new Main();
    System.out.println(myObj.x);
  }' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1
]

{ #category : 'tests' }
TSParserJavaTest >> testRootOfSimpleJavaClasstHasOneNamedChild [

	| string tree |
	
	string := ' public static void main(String[] args) {
    Main myObj = new Main();
    System.out.println(myObj.x);
  }' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1
]
