"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestTreeSitterLibraries',
	#superclass : 'PackageManifest',
	#category : 'TreeSitter-Libraries-Manifest',
	#package : 'TreeSitter-Libraries',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestTreeSitterLibraries class >> ruleGuardingClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#TSLibraries #ensureTreeSitterLibraryExists #false)) #'2025-05-27T16:11:22.055+02:00') )
]
