Class {
	#name : 'TSTree',
	#superclass : 'FFIOpaqueObject',
	#instVars : [
		'originString'
	],
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'accessing' }
TSTree >> originString [

	^ originString
]

{ #category : 'accessing' }
TSTree >> originString: anObject [

	originString := anObject
]

{ #category : 'private' }
TSTree >> rootNode [

	^ TSLibrary uniqueInstance ts_tree_root_node: self
]
