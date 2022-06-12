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
