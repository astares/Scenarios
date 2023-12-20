"
Basic scenarios for running features
"
Class {
	#name : #RunningScenarioFeature,
	#superclass : #Feature,
	#category : #'Scenarios-Features'
}

{ #category : #steps }
RunningScenarioFeature >> allStepsRunCorrectly [

	<Given: 'all its steps run correctly'>
	self pending
]

{ #category : #scenarios }
RunningScenarioFeature >> runningAScenario [

	<Scenario: 'Running a scenario'>
	self given: 'a simple scenario';
		given: 'all its steps run correctly';
		when: 'we run the scenario';
		then: 'the scenario passes';
		then: 'all the steps pass'
]

{ #category : #steps }
RunningScenarioFeature >> simpleScenario [

	<Given: 'a simple scenario'>
	scenario := Scenario title: 'a scenario' feature: self.
]
