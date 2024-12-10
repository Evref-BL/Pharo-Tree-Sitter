Class {
	#name : 'TSTree',
	#superclass : 'FFIOpaqueObject',
	#category : 'TreeSitter',
	#package : 'TreeSitter'
}

{ #category : 'private' }
TSTree >> rootNode [

	^ TSLibrary uniqueInstance ts_tree_root_node: self
]
