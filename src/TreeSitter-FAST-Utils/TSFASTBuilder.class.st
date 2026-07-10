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
    | method classes traits |
    method := String streamContents: [ :stream |
        stream << 'defineClasses'; cr; tab; << 'super defineClasses.'.
        classes := self typesRefied copy.
        classes remove: #tEntity ifAbsent: [].
        
        traits := self nodeTypesData ifNil: [ #() ] ifNotNil: [ :nodes |
            (nodes select: [ :n | n includesKey: 'subtypes' ]) 
                collect: [ :n | (self slotNameForNodeType: (n at: 'type')) asSymbol ]
        ].
        
        classes do: [ :type |
            type ifNotEmpty: [
                (traits includes: type) ifFalse: [
                    stream cr; tab; << type uncapitalized pharoLiteralCompatible; << ' := builder newClassNamed: #'; << type pascalized; << '.' 
                ]
            ] 
        ] separatedBy: [ stream << '' ] 
    ].
    metamodelGeneratorClass compile: method classified: #definition
]

{ #category : 'building' }
TSFASTBuilder >> addDefineHierarchyIn: metamodelGeneratorClass [
    | method |
    method := String streamContents: [ :stream |
        stream << 'defineHierarchy'; cr; tab; << '"define class hierarchy"'; cr.
        stream tab; << 'super defineHierarchy.'; cr.
        stream tab; << 'entity --|> tEntity.'; cr; cr.
        
        self nodeTypesData ifNotNil: [ :nodes |
            nodes do: [ :node |
                | parentType parentVar |
                parentType := node at: 'type'.
                parentVar := self slotNameForNodeType: parentType.
                
                (node at: 'subtypes' ifAbsent: [ #() ]) do: [ :subNode |
                    | subType subVar subNodeFull isValid |
                    subType := subNode at: 'type'.
                    
                    "On cherche le nœud complet pour vérifier s'il est nommé ou abstrait"
                    subNodeFull := self nodeTypesData detect: [ :n | (n at: 'type') = subType ] ifNone: [ nil ].
                    
                    isValid := subNodeFull isNotNil and: [ 
                        (subNodeFull at: 'named' ifAbsent: [ false ]) = true or: [ subNodeFull includesKey: 'subtypes' ] 
                    ].
                    
                    isValid ifTrue: [
                        subVar := self slotNameForNodeType: subType.
                        stream tab; << subVar; << ' --|> '; << parentVar; << '.'; cr.
                    ].
                ].
            ].
        ].
    ].
    metamodelGeneratorClass compile: method classified: #definition.
]

{ #category : 'building' }
TSFASTBuilder >> addDefineRelationsIn: metamodelGeneratorClass [
    | method |
    method := String streamContents: [ :stream |
        | parentMap |
        parentMap := self buildParentMap.
        
        stream << 'defineRelations'; cr; tab; << 'super defineRelations.'; cr.
        stream cr; tab; << '(entity property: #''genericChildren'') <>-* (entity property: #''genericParent'').'; cr; cr.
        
        self nodeTypesData ifNotNil: [ :nodes |
            (nodes select: [ :node | (node at: 'named' ifAbsent: [ false ]) = true ]) do: [ :node |
                | nodeType varName fields children |
                nodeType := node at: 'type'.
                varName := self slotNameForNodeType: nodeType.
                fields := node at: 'fields' ifAbsent: [ Dictionary new ].
                children := node at: 'children' ifAbsent: [ nil ].
                
                fields isEmpty ifFalse: [
                    stream cr; tab; << '" '; << nodeType asUppercase; << ' "'; cr.
                    fields keysAndValuesDo: [ :fieldName :fieldInfo |
                        | camelField isMultiple validTypes validTypeNames targetClassVar |
                        camelField := self toCamelCase: fieldName.
                        isMultiple := fieldInfo at: 'multiple' ifAbsent: [ false ].
                        
								"Children side"
                        validTypes := (fieldInfo at: 'types' ifAbsent: [ #() ]) select: [ :t | (t at: 'named' ifAbsent: [ false ]) = true ].
                        validTypeNames := validTypes collect: [ :t | t at: 'type' ].
                        targetClassVar := self commonAncestorOfAll: validTypeNames in: parentMap.
                        
                        stream tab; << '(('; << varName; << ' property: #'; << camelField; << ') comment: '''')'.
                        isMultiple 
                            ifTrue: [ stream cr; tab; tab; << '<>-* ' ]
                            ifFalse: [ stream cr; tab; tab; << '<>- ' ].
                        stream << '(('; << targetClassVar; << ' property: #'; << varName; << camelField capitalized; << 'Owner) comment: '''').'; cr; cr.
                    ].
                ].
                
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
    | method classes traits |
    method := String streamContents: [ :stream |
        stream << 'defineTraits'; cr; tab; << 'super defineTraits.'; cr; tab.
        stream << '"From FAST"'; cr; tab.
        stream << 'tEntity := self remoteTrait: #TEntity withPrefix: #FAST.'.
        
        classes := self typesRefied copy.
        classes remove: #tEntity ifAbsent: [].
        
        traits := self nodeTypesData ifNil: [ #() ] ifNotNil: [ :nodes |
            (nodes select: [ :n | n includesKey: 'subtypes' ]) 
                collect: [ :n | (self slotNameForNodeType: (n at: 'type')) asSymbol ]
        ].
        
        classes do: [ :type |
            type ifNotEmpty: [
                (traits includes: type) ifTrue: [
                    stream cr; tab; << type uncapitalized pharoLiteralCompatible; << ' := builder newTraitNamed: #'; << type pascalized; << '.' 
                ]
            ] 
        ] separatedBy: [ stream << '' ] 
    ].
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

{ #category : 'utils' }
TSFASTBuilder >> ancestorsOf: aNodeType in: parentMap [
    | ancestors current |
    ancestors := OrderedCollection new.
    current := aNodeType.
    [ current notNil ] whileTrue: [
        ancestors add: current.
        current := parentMap at: current ifAbsent: [ nil ]
    ].
    ^ ancestors
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

{ #category : 'utils' }
TSFASTBuilder >> buildParentMap [
	| map |
	map := Dictionary new.
	self nodeTypesData ifNotNil: [ :nodes |
		nodes do: [ :node |
			(node at: 'subtypes' ifAbsent: [ #()]) do: [ :subNode |
				map at: (subNode at: 'type') put: (node at: 'type') ] ] ].
	^map 
]

{ #category : 'utils' }
TSFASTBuilder >> commonAncestorOfAll: typeList in: parentMap [
    | commonAncestors |
    typeList isEmpty ifTrue: [ ^ 'tEntity' ].
    
    commonAncestors := self ancestorsOf: typeList first in: parentMap.
    
    "On croise avec les ancêtres des autres types de la liste"
    typeList allButFirstDo: [ :type |
        | ancestors |
        ancestors := self ancestorsOf: type in: parentMap.
        commonAncestors := commonAncestors select: [ :each | ancestors includes: each ].
    ].
    
    "S'il y a un ancêtre commun, on renvoie son nom formaté, sinon tEntity"
    commonAncestors isEmpty 
        ifTrue: [ ^ 'tEntity' ]
        ifFalse: [ ^ self slotNameForNodeType: commonAncestors first ]
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
    | classBuilder className types nodeTypes |
    className := #FAST , self languageName.
    classBuilder := FamixMetamodelGenerator << (className , #MetamodelGenerator).
    
    self typesRefied: { #entity. #_ERROR. #tEntity } asOrderedCollection.
    
    "On applique pharoLiteralCompatible immédiatement sur les types de l'API C"
    types := (self typesToReify collect: [ :type | 
        (self variableNameOfTSSymbol: type) pascalized uncapitalized asSymbol pharoLiteralCompatible 
    ]) sorted: #yourself ascending.
    
    "On l'applique aussi immédiatement sur les types du JSON"
    nodeTypes := self nodeTypesData 
        ifNil: [ #() ] 
        ifNotNil: [ :nodes | 
            (nodes select: [ :node | 
                (node at: 'named' ifAbsent: [ false ]) = true or: [ node includesKey: 'subtypes' ]
            ]) collect: [ :node | 
                (self slotNameForNodeType: (node at: 'type')) asSymbol pharoLiteralCompatible
            ] 
        ].
    
    "On fusionne (maintenant les doublons seront parfaitement détectés et éliminés)"
    self typesRefied: ((self typesRefied asArray , types asArray , nodeTypes asArray) asOrderedCollection 
        removeDuplicates 
        reject: [ :each | 
            each isEmpty or: [ (each asString first isLetter or: [ each asString first = $_ ]) not ] 
        ]).
    
    classBuilder slots: self typesRefied.
    classBuilder package: #FAST , '-' , self languageName , '-Model-Generator'.
    
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

{ #category : 'utils' }
TSFASTBuilder >> isAbstractType: typeName [
    self nodeTypesData ifNotNil: [ :nodes |
        nodes do: [ :n |
            (n at: 'type') = typeName ifTrue: [ ^ n includesKey: 'subtypes' ]
        ]
    ].
    ^ false
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
    
    camel = 'false' ifTrue: [ ^ 'falseClass' ].
    camel = 'true' ifTrue: [ ^ 'trueClass' ].
    camel = 'super' ifTrue: [ ^ 'superClass' ].
    
    (self isAbstractType: aString) ifTrue: [ ^ 't', camel capitalized ].
    
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
