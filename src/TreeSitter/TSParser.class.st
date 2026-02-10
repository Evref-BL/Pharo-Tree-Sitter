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
TSParser class >> language: aLanguage [

	^ self new
		  language: aLanguage;
		  yourself
]

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

{ #category : 'initialization' }
TSParser >> logger [

	^ TSLibrary uniqueInstance ts_parser_logger: self
]

{ #category : 'initialization' }
TSParser >> logger: aTSLogger [

	^ TSLibrary uniqueInstance ts_parser: self _set_logger: aTSLogger
]

{ #category : 'parsing' }
TSParser >> parseString: aString [

	"default method: empty tree and ecoding is ut8. 
	To be used for the first time"
	
	^ self parseString: aString usingTree: ExternalAddress null
]

{ #category : 'parsing' }
TSParser >> parseString: aString usingTree: aTree [

	"to be used after editing the old tree which must be past here as a parameter to make an incremental parsing"
	"the encoding is set using pharo as default utf8"
	
	^ self parseString: aString usingTree: aTree pharoEncoding: #utf8. 
]

{ #category : 'parsing' }
TSParser >> parseString: aString usingTree: aTree encoding: anEncoding [
	"to be used after editing the old tree which must be past here as a parameter to make an incremental parsing and to specifyEncoding"

	self
		deprecated:
		'Use parseString:usingTree:tsEncoding: instead of current one'
		on: '6 February 2026'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1571.sha.cf5fcd22e66957962c97dffc58b0393b7f368147 (64 Bit)'.

	^ TSLibrary uniqueInstance
		  ts_parser: self
		  _parse_string: aString
		  ofLength: aString size
		  usingOldTree: aTree
		  encoding: anEncoding
]

{ #category : 'parsing' }
TSParser >> parseString: aString usingTree: aTree pharoEncoding: anEncoding [

	"to be used after editing the old tree which must be past here as a parameter to make an incremental parsing"
	"the encoding is set by the user using pharo encoding"
	"if you want to pass an empty tree use ExternalAddress null"
	
	| stringToConsider |
	stringToConsider := aString encodeWith: anEncoding. 	 
	^ TSLibrary uniqueInstance
		  ts_parser: self
		  _parse_string: stringToConsider 
		  ofLength: stringToConsider size
		  usingOldTree: aTree
]

{ #category : 'parsing' }
TSParser >> printDotGraphTo: aFileDescriptor [
	"-1 for no"

	^ TSLibrary uniqueInstance
		  ts_parser: self
		  _print_dot_graphs: aFileDescriptor
TSParser >> parseString: aString usingTree: aTree tsEncoding: anEncoding [

	"to be used after editing the old tree which must be past here as a parameter to make an incremental parsing and to specifyEncoding"
	"if you want to pass an empty tree use ExternalAddress null"
	"This method is using treeSitter encoding; check TSInputEncoding class side to know what you can use"
	  
	^ TSLibrary uniqueInstance
		  ts_parser: self
		  _parse_string: aString 
		  ofLength: aString size
		  usingOldTree: aTree
		  encoding: anEncoding
]

{ #category : 'initialization' }
TSParser >> reset [ 

	TSLibrary uniqueInstance ts_parser_reset: self
]
