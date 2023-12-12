Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
ScenarioTest >> testScenarioHasOneOrMoreSteps [

	| step |
	step := (TestFeature new scenarioNamed: 'A Scenario has one or more steps') steps first.
	self
		assert: step type equals: #Given;
		assert: step text equals: 'A scenario with steps'
]

{ #category : #tests }
ScenarioTest >> testScenarioHasTitle [

	| scenario |
	scenario := (TestFeature new scenarioNamed:
		         'A Scenario has one or more steps').
	self assert: scenario title equals: 'A Scenario has one or more steps'
]
