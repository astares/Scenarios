"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestScenarios,
	#superclass : #PackageManifest,
	#category : #'Scenarios-Manifest'
}

{ #category : #'code-critics' }
ManifestScenarios class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Feature #buildScenarioFromMethod: #false)) #'2022-06-12T21:05:31.156+01:00') )
]

{ #category : #'code-critics' }
ManifestScenarios class >> ruleClassNameInSelectorRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'Feature class' #isFeature #true)) #'2023-12-15T01:53:06.744+01:00') )
]

{ #category : #'code-critics' }
ManifestScenarios class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#ScenarioStepDefinition #setUp #false)) #'2023-12-13T00:07:22.271+01:00') #(#(#RGMethodDefinition #(#ScenarioStepDefinition #tearDown #false)) #'2023-12-13T00:07:26.22+01:00') #(#(#RGMethodDefinition #(#ScenarioStepDefinition #resources #false)) #'2023-12-13T00:07:29.543+01:00') )
]

{ #category : #'code-critics' }
ManifestScenarios class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestScenarios class' #ManifestScenarios)) #'2023-12-13T00:14:02.557+01:00') )
]

{ #category : #'code-critics' }
ManifestScenarios class >> ruleUsesAddRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#FeatureResult #addResult: #false)) #'2023-12-18T22:35:20.494+01:00') )
]

{ #category : #'code-critics' }
ManifestScenarios class >> ruleVariableReferencedOnceRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#ScenarioResult)) #'2023-12-19T15:31:36.995+00:00') )
]
