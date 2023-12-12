Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Tests'
}

{ #category : #tests }
ScenarioTest >> testScenarioHasOneOrMoreSteps [

	| step |
	step := (SampleFeature new scenarioNamed: 'A scenario has one or more steps') steps first.
	self
		assert: step type equals: #Given;
		assert: step text equals: 'A scenario with steps'
]

{ #category : #tests }
ScenarioTest >> testScenarioHasTitle [

	| scenario |
	scenario := (SampleFeature new scenarioNamed:
		         'A scenario has one or more steps').
	self assert: scenario title equals: 'A scenario has one or more steps'
]
