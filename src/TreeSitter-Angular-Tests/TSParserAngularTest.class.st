Class {
	#name : 'TSParserAngularTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'angularDSL'
	],
	#category : 'TreeSitter-Angular-Tests',
	#package : 'TreeSitter-Angular-Tests'
}

{ #category : 'running' }
TSParserAngularTest >> setUp [

	super setUp.
	self timeLimit: 120 seconds.
	parser := TSParser new.
	angularDSL := TSLanguage angular .
	parser language: angularDSL 
]

{ #category : 'running' }
TSParserAngularTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserAngularTest >> testChildrenCollection [

	| string tree |
	string := '<div (click)="items.sort((a, b) => a - b)"/>' withPlatformLineEndings.

	tree := parser parseString: string. 
	
	self assert: tree rootNode collectNamedChild size equals: 1. 
	self assert: tree rootNode firstNamedChild collectNamedChild size equals: 1.
	self assert: tree rootNode firstNamedChild firstNamedChild collectNamedChild size equals: 2. 
]

{ #category : 'tests' }
TSParserAngularTest >> testParseAngularLoop [

	| string tree |
	string := '*ngFor=''let tr of trow; index as i''' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1.
	self assert: tree rootNode namedChildren first type equals: 'text'.
]

{ #category : 'tests' }
TSParserAngularTest >> testParseAngularMixedWithHTML [

	| string tree |
	string := '<div class="card-body border-top">
        <p *ngFor="let alert of alerts">
          <ngb-alert [type]="alert.type" [dismissible]="false" class="customize-alert fs-5">
            {{ alert.type }} - {{ alert.message }}
          </ngb-alert>
        </p>
      </div>' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode  isNotNil . 
	self assert: tree rootNode firstNamedChild firstNamedChild namedChildren size equals: 2.
	self assert: tree rootNode firstNamedChild firstNamedChild namedChildren first type equals: 'tag_name'.
	self assert: tree rootNode firstNamedChild firstNamedChild namedChildren second type equals: 'attribute'. 
	
]

{ #category : 'tests' }
TSParserAngularTest >> testParseAngularStructuralDirectives [

	| string tree |
	string := '<span *ngIf="someCondition">{{ value }}</span>
<span *ngIf="someCondition && otherCondition">{{ value }}</span>' withPlatformLineEndings.

	tree := parser parseString: string.
	self assert: tree rootNode firstNamedChild namedChildCount equals: 3.
	self assert: tree rootNode firstNamedChild type equals: 'element'.
	self assert: tree rootNode firstNamedChild namedChildren first type equals: 'start_tag'.
	self assert: tree rootNode firstNamedChild namedChildren second type equals: 'interpolation'.
	self assert: tree rootNode firstNamedChild namedChildren third type equals: 'end_tag'.
	
	
]
