Class {
	#name : 'BaselineOfTreeSitter',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTreeSitter',
	#package : 'BaselineOfTreeSitter'
}

{ #category : 'baselines' }
BaselineOfTreeSitter >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec. ]
]

{ #category : 'baselines' }
BaselineOfTreeSitter >> defineDependencies: spec [


	spec baseline: 'PharoBackwardCompatibility' with: [ spec repository: 'github://jecisc/PharoBackwardCompatibility:v1.x.x/src' ].
  
	spec
        baseline: 'NeoJSON'
        with: [
            spec
                loads: #('default');
                repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : 'baselines' }
BaselineOfTreeSitter >> defineGroups: spec [

	spec
		group: 'default'
		with: #( 'TreeSitter' 'TreeSitter-Tests' 'TreeSitter-Spec' 'TreeSitter-Highlighter' 'TreeSitter-Visitor' 'TreeSitter-Libraries' 'TreeSitter-Typescript'
			   'TreeSitter-Typescript-Tests' ).

	spec group: 'moose' with: #( 'default' 'TreeSitter-FAST-Utils' ).

	spec group: 'xml' with: #( 'default' 'TreeSitter-XML' 'TreeSitter-XML-Tests' ).
	spec group: 'python' with: #( 'default' 'TreeSitter-Python' 'TreeSitter-Python-Tests' ).
	spec group: 'yaml' with: #( 'default' 'TreeSitter-YAML' 'TreeSitter-YAML-Tests' ).
	spec group: 'html' with: #( 'default' 'TreeSitter-HTML' 'TreeSitter-HTML-Tests' ).
	spec group: 'css' with: #( 'default' 'TreeSitter-CSS' 'TreeSitter-CSS-Tests' ).
	spec group: 'typescript' with: #( 'default' 'TreeSitter-Typescript' 'TreeSitter-Typescript-Tests' ).
	spec group: 'cLang' with: #( 'default' 'TreeSitter-C' 'TreeSitter-C-Tests' ).
	spec group: 'groovy' with: #( 'default' 'TreeSitter-Groovy' 'TreeSitter-Groovy-Tests' ).
	spec group: 'mermaid' with: #( 'default' 'TreeSitter-Mermaid' 'TreeSitter-Mermaid-Tests' ).
	spec group: 'java' with: #( 'default' 'TreeSitter-Java' 'TreeSitter-Java-Tests' ).
	spec group: 'scss' with: #( 'default' 'TreeSitter-scss' 'TreeSitter-scss-Tests' ).
]

{ #category : 'baselines' }
BaselineOfTreeSitter >> definePackages: spec [
	"Core"

	spec
		package: 'TreeSitter'
		with: [ spec requires: #( 'PharoBackwardCompatibility' ) ];
		package: 'TreeSitter-Visitor'
		with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Highlighter'
		with: [ spec requires: #( 'TreeSitter' ) ];
		package: 'TreeSitter-Spec'
		with: [ spec requires: #( 'TreeSitter-Visitor' ) ];
		package: 'TreeSitter-Libraries'
		with: [ spec requires: #( 'TreeSitter' 'NeoJSON' ) ];
		package: 'TreeSitter-FAST-Utils'
		with: [ spec requires: #( 'TreeSitter-Visitor' ) ].

	"Core tests ( Only Typescript is loaded by default cz many tests depend on it. )"
	spec package: 'TreeSitter-Tests' with: [
		spec requires: #( 'TreeSitter' 'TreeSitter-Typescript' ).
		spec postLoadDoIt: #postLoadTSLibrary ].
	spec
		package: 'TreeSitter-Typescript' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadTypescriptLibrary ];
		package: 'TreeSitter-Typescript-Tests'
		with: [ spec requires: #( 'TreeSitter-Typescript' ) ].

	"Optional language packages"

	spec
		package: 'TreeSitter-Python' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadPythonLibrary ];
		package: 'TreeSitter-Python-Tests'
		with: [ spec requires: #( 'TreeSitter-Python' ) ].

	spec
		package: 'TreeSitter-XML' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadXMLLibrary ];
		package: 'TreeSitter-XML-Tests'
		with: [ spec requires: #( 'TreeSitter-XML' ) ].

	spec
		package: 'TreeSitter-HTML' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadHTMLLibrary ];
		package: 'TreeSitter-HTML-Tests'
		with: [ spec requires: #( 'TreeSitter-HTML' ) ].

	spec
		package: 'TreeSitter-YAML' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadYAMLLibrary ];
		package: 'TreeSitter-YAML-Tests'
		with: [ spec requires: #( 'TreeSitter-YAML' ) ].

	spec
		package: 'TreeSitter-CSS' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadCSSLibrary ];
		package: 'TreeSitter-CSS-Tests'
		with: [ spec requires: #( 'TreeSitter-CSS' ) ].

	spec
		package: 'TreeSitter-C' with: [
			spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadCLibrary ];
		package: 'TreeSitter-C-Tests'
		with: [ spec requires: #( 'TreeSitter-C' ) ].

	spec
		package: 'TreeSitter-Groovy'
		with: [ spec requires: #( 'TreeSitter' ).
			spec postLoadDoIt: #postLoadGroovyLibrary ];
		package: 'TreeSitter-Groovy-Tests'
		with: [ spec requires: #( 'TreeSitter-Groovy' ) ]. 
		
	spec
		package: 'TreeSitter-Mermaid'
		with: [ spec requires: #( 'TreeSitter' ) .
			spec postLoadDoIt: #postLoadMermaidLibrary ];
		package: 'TreeSitter-Mermaid-Tests'
		with: [ spec requires: #( 'TreeSitter-Mermaid' ) ]. 
		
	spec
		package: 'TreeSitter-Java'
		with: [ spec requires: #( 'TreeSitter' ) .
			spec postLoadDoIt: #postLoadJavaLibrary ];
		package: 'TreeSitter-Java-Tests'
		with: [ spec requires: #( 'TreeSitter-Java' ) ].
		
	spec
		package: 'TreeSitter-SCSS'
		with: [ spec requires: #( 'TreeSitter' ) .
			spec postLoadDoIt: #postLoadSCSSLibrary ];
		package: 'TreeSitter-SCSS-Tests'
		with: [ spec requires: #( 'TreeSitter-SCSS' ) ]. 
		
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadCLibrary [  
	TSLibrariesC new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadCSSLibrary [   
	TSLibrariesCSS new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadGroovyLibrary [

	TSLibrariesGroovy new ensureTreeSitterLibraryExists
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadHTMLLibrary [  
	TSLibrariesHTML new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadJavaLibrary [  
	TSLibrariesJava new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadMermaidLibrary [

	TSLibrariesMermaid new ensureTreeSitterLibraryExists
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadPythonLibrary [  
	TSLibrariesPython new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadSCSSLibrary [  
	TSLibrariesSCSS new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadTSLibrary [ 
	TSLibraries new ensureTreeSitterLibraryExists.
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadTypescriptLibrary [ 
	TSLibrariesTypescript new ensureTreeSitterLibraryExists 
 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadXMLLibrary [  
	TSLibrariesXML new ensureTreeSitterLibraryExists 
]

{ #category : 'as yet unclassified' }
BaselineOfTreeSitter >> postLoadYAMLLibrary [  
	TSLibrariesYAML new ensureTreeSitterLibraryExists 
]
