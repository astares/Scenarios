Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #tests }
ScenarioTest >> testInstanceCreation [

	|newInstance|
	newInstance := Scenario title: 'My scenario'.
	
	self assert: newInstance title equals: 'My scenario'.
	
	self assert: newInstance hasTitle.
	self deny: newInstance hasSteps

]

{ #category : #'tests - printing' }
ScenarioTest >> testPrintStringWithoutSteps [

	|newInstance|
	newInstance := Scenario title: 'My scenario'.
	
	self assert: newInstance printString equals: 'Scenario: My scenario'

]

{ #category : #'tests - printing' }
ScenarioTest >> testPrintStringWithoutTitle [

	self assert: Scenario new printString equals: 'a Scenario'
]

{ #category : #'tests - sample' }
ScenarioTest >> testSampleScenarioHasOneOrMoreSteps [

	| sampleScenario step |
	sampleScenario := SampleFeature new scenarioNamed: 'A scenario has one or more steps'.
	step := sampleScenario steps first.
	self
		assert: step type equals: #Given;
		assert: step text equals: 'A scenario with steps'
]

{ #category : #'tests - sample' }
ScenarioTest >> testSampleScenarioHasTitle [

	| sampleScenario |
	sampleScenario := (SampleFeature new scenarioNamed:
		         'A scenario has one or more steps').
	self assert: sampleScenario title equals: 'A scenario has one or more steps'
]
