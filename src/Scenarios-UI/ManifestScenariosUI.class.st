"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScenariosUI,
	#superclass : #PackageManifest,
	#category : #'Scenarios-UI-Manifest'
}

{ #category : #'code-critics' }
ManifestScenariosUI class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#ScenarioIconProvider)) #'2023-12-14T00:27:55.106+01:00') )
]

{ #category : #'code-critics' }
ManifestScenariosUI class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestScenariosUI class' #ManifestScenariosUI)) #'2023-12-14T00:27:17.512+01:00') )
]

{ #category : #'code-critics' }
ManifestScenariosUI class >> ruleReIconHardcodedMessageRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'ScenarioIconProvider class' #initialize #true)) #'2023-12-13T23:32:27.659+01:00') )
]
