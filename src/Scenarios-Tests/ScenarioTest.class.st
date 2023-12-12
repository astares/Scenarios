Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Tests'
}

{ #category : #tests }
ScenarioTest >> testInstanceCreation [

	|newInstance|
	newInstance := Scenario title: 'My scenario'.
	
	self assert: newInstance title equals: 'My scenario'.
	self deny: newInstance hasSteps

]

{ #category : #'tests - sample' }
ScenarioTest >> testScenarioHasOneOrMoreSteps [

	| step |
	step := (SampleFeature new scenarioNamed: 'A scenario has one or more steps') steps first.
	self
		assert: step type equals: #Given;
		assert: step text equals: 'A scenario with steps'
]

{ #category : #'tests - sample' }
ScenarioTest >> testScenarioHasTitle [

	| scenario |
	scenario := (SampleFeature new scenarioNamed:
		         'A scenario has one or more steps').
	self assert: scenario title equals: 'A scenario has one or more steps'
]
