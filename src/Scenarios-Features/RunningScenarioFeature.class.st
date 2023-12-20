Class {
	#name : #RunningScenarioFeature,
	#superclass : #Feature,
	#category : #'Scenarios-Features'
}

{ #category : #scenarios }
RunningScenarioFeature >> runningAScenario [

	<Scenario: 'Running a scenario'>
	self given: 'a simple scenario';
		given: 'all its steps run correctly';
		when: 'we run the scenario';
		then: 'the scenario passes';
		then: 'all the steps pass'
]
