"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScenariosDrTests,
	#superclass : #PackageManifest,
	#category : #'Scenarios-DrTests-Manifest'
}

{ #category : #'code-critics' }
ManifestScenariosDrTests class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#DTBddPlugin)) #'2023-12-18T22:31:35.652+01:00') )
]
