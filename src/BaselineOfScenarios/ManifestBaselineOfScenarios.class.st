"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfScenarios,
	#superclass : #PackageManifest,
	#category : #'BaselineOfScenarios-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfScenarios class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#BaselineOfScenarios)) #'2023-12-12T21:06:53.045+01:00') )
]
