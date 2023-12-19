"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScenariosTests,
	#superclass : #PackageManifest,
	#category : #'Scenarios-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestScenariosTests class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#SampleStepDefinitions)) #'2023-12-13T01:34:16.002+01:00') )
]
