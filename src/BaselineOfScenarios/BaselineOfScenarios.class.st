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

		"Packages"
		spec
			package: 'Scenarios';
			package: 'Scenarios-UI' with: [ spec requires: 'Scenarios' ];
			package: 'Scenarios-Tests' with: [ spec requires: 'Scenarios' ].

		"Groups"
		spec
			group:	 'Core' with: #('Scenarios');
			group: 'UI' with: #('Scenarios-UI');
			group:	 'Tests' with: #('Scenarios-Tests');
			group: 'CI' with: #('Core' 'UI' 'Tests').

		"Virtual groups"
		spec
			group: 'all' with: #('Core' 'UI' 'Tests');
			group: 'default' with: #('all')
	]
]
