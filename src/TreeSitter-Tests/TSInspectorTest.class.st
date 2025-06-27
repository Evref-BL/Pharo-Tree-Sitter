Class {
	#name : 'TSInspectorTest',
	#superclass : 'TestCase',
	#category : 'TreeSitter-Tests-Inspector',
	#package : 'TreeSitter-Tests',
	#tag : 'Inspector'
}

{ #category : 'tests' }
TSInspectorTest >> testTreeShowsCorrectlyOnInspect [

	| code parser ast presenter |
	code := '
		int main(){
		printf("Hello");
	}
	'.
	parser := TSParser new.
	parser language: TSLanguage cLang.
	ast := (parser parseString: code) rootNode.
	
	"inspect the ast inside a presenter"
	presenter := ast tsTreeExtension:
		             (SpPresenterBuilder newApplication:
			              SpNullApplication defaultApplication).

	self assert: presenter roots first class equals: TSNode.
	self assert: presenter roots first type equals: 'translation_unit'.
]
