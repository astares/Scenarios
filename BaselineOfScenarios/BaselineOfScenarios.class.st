Class {
	#name : #BaselineOfScenarios,
	#superclass : #BaselineOf,
	#category : #BaselineOfScenarios
}

{ #category : #baselines }
BaselineOfScenarios >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Scenarios';
			package: 'Scenarios-Tests' with: [ spec requires: 'Scenarios' ] ]
]
