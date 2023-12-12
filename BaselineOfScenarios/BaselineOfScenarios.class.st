"
Baseline for [https://github.com/gcorriga/Scenarios](https://github.com/gcorriga/Scenarios)
"
Class {
	#name : #BaselineOfScenarios,
	#superclass : #BaselineOf,
	#category : #'BaselineOfScenarios-Base'
}

{ #category : #baselines }
BaselineOfScenarios >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Scenarios';
			package: 'Scenarios-Tests' with: [ spec requires: 'Scenarios' ] ]
]
