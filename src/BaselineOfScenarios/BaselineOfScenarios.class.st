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
			package: 'Scenarios-DrTests' with: [ spec requires: 'Scenarios-UI' ];
			package: 'Scenarios-Tools' with: [ spec requires: #('Scenarios-DrTests' 'Scenarios-UI')];
			package: 'Scenarios-Tests' with: [ spec requires: 'Scenarios' ].

		"Groups"
		spec
			group:	 'Core' with: #('Scenarios');
			group: 'UI' with: #('Scenarios-UI');
			group: 'Tools' with: #('Scenarios-DrTests' 'Scenarios-Tools');
			group:	 'Tests' with: #('Scenarios-Tests');
			group: 'CI' with: #('Core' 'UI' 'Tools' 'Tests').

		"Virtual groups"
		spec
			group: 'all' with: #('Core' 'UI' 'Tools' 'Tests');
			group: 'default' with: #('all')
	]
]
