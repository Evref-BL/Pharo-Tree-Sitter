"
I build a FAST metamodel generator based on a tree sitter language.

The output will be a FAST generator producing a class for each possible nodes and one relation between #genericChildren and #genericParent.

You will need to refine this generator yourself to introduce hierarchies, traits, relations and properties.

This will also generate the base of an importer to import the generated code.

Here is an example of usage:

```
TSFASTBuilder new
    languageName: 'Py';
    tsLanguage: TSLanguage python;
    build.

FASTPythonMetamodelGenerator new generate
```
"
Class {
	#name : 'TSFASTBuilder',
	#superclass : 'Object',
	#instVars : [
		'tsLanguage',
		'languageName',
		'typesRefied',
		'nodeTypesJsonUrl',
		'nodeTypesData'
	],
	#category : 'TreeSitter-FAST-Utils',
	#package : 'TreeSitter-FAST-Utils'
}

{ #category : 'building' }
TSFASTBuilder >> addDefineClassIn: metamodelGeneratorClass [

	| method classes |
	method := String streamContents: [ :stream |
			          stream << 'defineClasses
	super defineClasses.
'.

			          classes := self typesRefied copy.
			          classes remove: #tEntity. "we have to remove it because it's to be added in Traits."
			          classes
				          do: [ :type | "| variable |
				          variable := (self variableNameOfTSSymbol: type) pascalized."
						          type ifNotEmpty: [
								          stream
									          << '	';
									          << type uncapitalized pharoLiteralCompatible;
									          << ' := '.
								          stream << 'builder newClassNamed: #' << type pascalized << '.' ] ]
				          separatedBy: [
						          stream << '
' ] ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addDefineHierarchyIn: metamodelGeneratorClass [
    | method |
    method := String streamContents: [ :stream |
        stream << 'defineHierarchy'; cr; tab; << '"define class hierarchy"'; cr.
        stream tab; << 'super defineHierarchy.'; cr.
        stream tab; << 'entity --|> tEntity.'; cr; cr.
        
     
    ].
    metamodelGeneratorClass compile: method classified: #definition.
]

{ #category : 'building' }
TSFASTBuilder >> addDefineRelationsIn: metamodelGeneratorClass [
    | method |
    method := String streamContents: [ :stream |
        stream << 'defineRelations'; cr; tab; << 'super defineRelations.'; cr.
        
        "Relation générique de base"
        stream cr; tab; << '(entity property: #''genericChildren'') <>-* (entity property: #''genericParent'').'; cr; cr.
        
        self nodeTypesData ifNotNil: [ :nodes |
            (nodes select: [ :node | (node at: 'named' ifAbsent: [ false ]) = true ]) do: [ :node |
                | nodeType varName fields children |
                nodeType := node at: 'type'.
                varName := self slotNameForNodeType: nodeType.
                fields := node at: 'fields' ifAbsent: [ Dictionary new ].
                children := node at: 'children' ifAbsent: [ nil ].
                
                "Génération des relations depuis les champs (fields) de l'AST"
                fields isEmpty ifFalse: [
                    stream cr; tab; << '" '; << nodeType asUppercase; << ' "'; cr.
                    fields keysAndValuesDo: [ :fieldName :fieldInfo |
                        | camelField isMultiple |
                        camelField := self toCamelCase: fieldName.
                        isMultiple := fieldInfo at: 'multiple' ifAbsent: [ false ].
                        
                        stream tab; << '(('; << varName; << ' property: #'; << camelField; << ') comment: '''')'.
                        isMultiple 
                            ifTrue: [ stream cr; tab; tab; << '<>-* ' ]
                            ifFalse: [ stream cr; tab; tab; << '<>- ' ].
                        stream << '((tEntity property: #'; << varName; << camelField capitalized; << 'Owner) comment: '''').'; cr; cr.
                    ].
                ].
                
                "Génération depuis les collections d'enfants non-nommées"
                (fields isEmpty and: [ children isNotNil ]) ifTrue: [
                    | isMultiple |
                    isMultiple := children at: 'multiple' ifAbsent: [ false ].
                    isMultiple ifTrue: [
                        stream cr; tab; << '" '; << nodeType asUppercase; << ' (COLLECTION) "'; cr.
                        stream tab; << '(('; << varName; << ' property: #childrenNodes) comment: '''')'; cr; tab; tab.
                        stream << '<>-* ((tEntity property: #'; << varName; << 'Owner) comment: '''').'; cr; cr.
                    ].
                ].
            ]
        ]
    ].
    metamodelGeneratorClass compile: method classified: #definition.
]

{ #category : 'building' }
TSFASTBuilder >> addDefineTraitsIn: metamodelGeneratorClass [

	| method |
	method := String streamContents: [ :stream |
		          stream << 'defineTraits

	super defineTraits.

	"From FAST"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.
' ].
	metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addPackageNameMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'packageName

	^ #''FAST-' , self languageName , '-Model'''
		classified: #accessing
]

{ #category : 'building' }
TSFASTBuilder >> addPrefixMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'prefix

	^ #FAST' , self languageName
		classified: #accessing
]

{ #category : 'building' }
TSFASTBuilder >> addSubmetamodelsMethodIn: metamodelGeneratorClass [

	metamodelGeneratorClass class
		compile: 'submetamodels

	^ { FASTMetamodelGenerator }'
		classified: #accessing
]

{ #category : 'api' }
TSFASTBuilder >> build [

	| metamodelGeneratorClass |
	metamodelGeneratorClass := self createMetamodelGeneratorClass.
	self addPrefixMethodIn: metamodelGeneratorClass.
	self addPackageNameMethodIn: metamodelGeneratorClass.
	self addSubmetamodelsMethodIn: metamodelGeneratorClass.
	self addDefineClassIn: metamodelGeneratorClass.
	self addDefineTraitsIn: metamodelGeneratorClass.
	self addDefineHierarchyIn: metamodelGeneratorClass.
	self addDefineRelationsIn: metamodelGeneratorClass.
	self createImporter.
	^ metamodelGeneratorClass
]

{ #category : 'building' }
TSFASTBuilder >> createImporter [

	| class |
	class := self class classInstaller make: [ :aBuilder |
			         aBuilder
				         name: #FAST , self languageName , #Importer;
				         superclass: TSFASTAbstractImporter;
				         package: #FAST , '-' , self languageName , #'-Tools' ].

	class
		compile: 'tsLanguage

	^ TSLanguage ' , tsLanguage name
		classified: 'accessing'
]

{ #category : 'building' }
TSFASTBuilder >> createMetamodelGeneratorClass [

	| classBuilder className types |
	className := #FAST , self languageName.
	classBuilder := FamixMetamodelGenerator << (className , #MetamodelGenerator).

	self typesRefied: { #entity. #_ERROR. #tEntity } asOrderedCollection. "we have to add it at the beginning, because maybe entity is retrieved as a symbol from treeSitter, so we make sure that duplication is remved after "

	types := (self typesToReify collect: [ :type | (self variableNameOfTSSymbol: type) pascalized uncapitalized asSymbol ]) sorted: #yourself ascending. "We sort alphabetically to have a cleaner generated code"

	self typesRefied: ((self typesRefied , types) removeDuplicates reject: [ :each | each isEmpty ]).

	classBuilder slots: (self typesRefied collect: #pharoLiteralCompatible).
	classBuilder package: #FAST , '-' , self languageName , #'-Model-Generator'.
	^ classBuilder install
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> fetchNodeTypesData [
    | jsonString |
    self nodeTypesJsonUrl ifNil: [ ^ self error: 'nodeTypesJsonUrl must be set before generating' ].
    
    jsonString := ZnClient new get: self nodeTypesJsonUrl.
    self nodeTypesData: (NeoJSONReader fromString: jsonString).
]

{ #category : 'building' }
TSFASTBuilder >> fieldToReify [

	^ 1 to: self tsLanguage fieldCount
]

{ #category : 'accessing' }
TSFASTBuilder >> languageName [

	^ languageName
]

{ #category : 'accessing' }
TSFASTBuilder >> languageName: anObject [

	languageName := anObject
]

{ #category : 'building' }
TSFASTBuilder >> nameOfField: aFieldIdx [

	^ tsLanguage nameOfField: aFieldIdx
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> nodeTypesData [
    nodeTypesData ifNil: [ self fetchNodeTypesData ].
    ^ nodeTypesData
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> nodeTypesData: aCollection [
    nodeTypesData := aCollection
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> nodeTypesJsonUrl [
    ^ nodeTypesJsonUrl
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> nodeTypesJsonUrl: aString [
    nodeTypesJsonUrl := aString
]

{ #category : 'building' }
TSFASTBuilder >> parentNameOfField: aFieldIdx [

	^ (self nameOfField: aFieldIdx) , 'Parent'
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> slotNameForNodeType: aString [
    | camel |
    camel := self toCamelCase: aString.
    
    "Gestion des mots-clés stricts"
    camel = 'false' ifTrue: [ ^ '_false' ].
    camel = 'true' ifTrue: [ ^ '_true' ].
    camel = 'super' ifTrue: [ ^ '_super' ].
    
    "S'assurer que la première lettre est en minuscule pour les noms de variables/méthodes"
    ^ camel uncapitalized
]

{ #category : 'as yet unclassified' }
TSFASTBuilder >> toCamelCase: aString [
    | parts |
    parts := aString asString substrings: '_'.
    ^ parts isEmpty 
        ifTrue: [ '' ] 
        ifFalse: [ parts first , (String streamContents: [ :s | (parts allButFirst) do: [ :p | s nextPutAll: p capitalized ] ]) ]
]

{ #category : 'accessing' }
TSFASTBuilder >> tsLanguage [

	^ tsLanguage
]

{ #category : 'accessing' }
TSFASTBuilder >> tsLanguage: anObject [

	tsLanguage := anObject
]

{ #category : 'accessing' }
TSFASTBuilder >> typesRefied [

	^ typesRefied
]

{ #category : 'accessing' }
TSFASTBuilder >> typesRefied: aCollection [

	typesRefied := aCollection
]

{ #category : 'building' }
TSFASTBuilder >> typesToReify [

	^ tsLanguage symbolsOfType: TSSymbolType tssymboltyperegular
]

{ #category : 'building' }
TSFASTBuilder >> variableNameOfTSSymbol: aTSSymbol [
    
 	| variable |
    variable := tsLanguage nameOfSymbol: aTSSymbol.
    ^ variable isEmpty ifTrue: [''] ifFalse: [ '_', variable] 
 
]
