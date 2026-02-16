Extension { #name : 'String' }

{ #category : '*TreeSitter-FAST-Utils' }
String >> pascalized [

	"Remove _ and capitalizes the first letter after"
	
	"'abc' pascalized >>> 'Abc'"
	 
    ^ String streamContents: [ :stream |
        (self findTokens: '_') do: [ :each |
            stream nextPutAll: each capitalized
        ]
    ]
]
