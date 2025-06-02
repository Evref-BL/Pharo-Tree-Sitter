"
# Installation process

## For windows

```{language=bash}
# assuming git, gcc, cmake, ninja installed via scoop
git clone https://github.com/tree-sitter/tree-sitter
git fetch origin v0.24.3
git checkout v0.24.3
cd tree-sitter
cd lib
mkdir build
cd build
cmake -G Ninja ..
ninja
```
"
Class {
	#name : 'TSParser',
	#superclass : 'FFIOpaqueObject',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'instance creation' }
TSParser class >> new [
	
	TSLibraries new ensureTreeSitterLibraryExists.
	^ TSLibrary uniqueInstance ts_parser_new
]

{ #category : 'instance creation' }
TSParser >> delete [
	^ TSLibrary uniqueInstance ts_parser_delete: self
]

{ #category : 'editing' }
TSParser >> editTree: aTree usingInputEdit: anInput [

	TSLibrary uniqueInstance ts_tree_edit: aTree forInputEdit: anInput.
]

{ #category : 'accessing' }
TSParser >> language [

	^ TSLibrary uniqueInstance ts_parser_language: self
]

{ #category : 'accessing' }
TSParser >> language: aTSLanguage [

	^ TSLibrary uniqueInstance ts_parser: self _set_language: aTSLanguage
]

{ #category : 'parsing' }
TSParser >> parseString: aString [
	"To be used for the first time"
	^ self parseString: aString usingTree: ExternalAddress null
]

{ #category : 'parsing' }
TSParser >> parseString: aString usingTree: aTree [

	"to be used after editing the old tree which must be past here as a parameter to make an incremental parsing"
	
	| stringToConsider |
	stringToConsider := aString withUnixLineEndings.
	^ TSLibrary uniqueInstance
		  ts_parser: self
		  _parse_string: stringToConsider 
		  ofLength: stringToConsider size
		  usingOldTree: aTree
]

{ #category : 'initialization' }
TSParser >> reset [ 

	TSLibrary uniqueInstance ts_parser_reset: self
]
