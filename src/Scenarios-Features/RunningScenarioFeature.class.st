"
Basic scenarios for running features
"
Class {
	#name : #RunningScenarioFeature,
	#superclass : #Feature,
	#instVars : [
		'result'
	],
	#category : #'Scenarios-Features'
}

{ #category : #steps }
RunningScenarioFeature >> allStepsPass [

	<Then: 'all the steps pass'>
	self assert: result passedCount equals: 3
]

{ #category : #steps }
RunningScenarioFeature >> allStepsRunCorrectly [

	<Given: 'all its steps run correctly'>
	scenario
		addStep: #Given text: 'a test scenario';
		addStep: #When text: 'we run the test scenario';
		addStep: #Then text: 'the test scenario passes'
]

{ #category : #steps }
RunningScenarioFeature >> runTheScenario [

	<When: 'we run the scenario'>
	result := scenario run
]

{ #category : #'steps - private' }
RunningScenarioFeature >> runTheTestScenario [

	<When: 'we run the test scenario'>
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
RunningScenarioFeature >> scenarioPasses [

	<Then: 'the scenario passes'>
	self assert: result isPassed
]

{ #category : #steps }
RunningScenarioFeature >> simpleScenario [

	<Given: 'a simple scenario'>
	scenario := Scenario title: 'a scenario' feature: self.
]

{ #category : #'steps - private' }
RunningScenarioFeature >> testScenario [

	<Given: 'a test scenario'>
]

{ #category : #'steps - private' }
RunningScenarioFeature >> testScenarioPasses [

	<Then: 'the test scenario passes'>
]
