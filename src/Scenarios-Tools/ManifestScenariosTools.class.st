"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScenariosTools,
	#superclass : #PackageManifest,
	#category : #'Scenarios-Tools-Manifest'
}

{ #category : #'code-critics' }
ManifestScenariosTools class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#SimpleScenarioRunner)) #'2023-12-18T22:07:29.004+01:00') )
]

{ #category : #'code-critics' }
ManifestScenariosTools class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestScenariosTools class' #ManifestScenariosTools)) #'2023-12-18T22:06:51.388+01:00') )
]

{ #category : #'code-critics' }
ManifestScenariosTools class >> ruleUtilityMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#SimpleScenarioRunner #runAll: #false)) #'2023-12-18T22:02:52.569+01:00') )
]
