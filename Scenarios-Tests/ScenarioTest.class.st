Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
ScenarioTest >> testRunningScenarioProducesResult [

	| result scenario |
	scenario := TestFeature new scenarioNamed:
		            'Running a scenario'.
	result := scenario runWith: TestStepDefinitions buildStepDefinitions.
	self assert: result resultCount equals: scenario steps size
]

{ #category : #tests }
ScenarioTest >> testScenarioStepsGetSkipped [

	| scenario result |
	scenario := TestFeature new scenarioNamed:
		            'A Scenario has one or more steps'.
	result := scenario runWith: TestStepDefinitions buildStepDefinitions.
	self assert: result skippedCount equals: 2
]
