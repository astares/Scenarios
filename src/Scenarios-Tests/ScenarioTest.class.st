Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #'tests - steps' }
ScenarioTest >> testAddingStep [
	| scenario |
	scenario := Scenario title: 'My scenario'.
	
	self deny: scenario hasSteps.
	
	scenario addStep: #Given text: 'My app has started'.
	
	self 
		assert: scenario hasSteps;
		assert: scenario steps size equals: 1;
		assert: scenario steps first text equals: 'My app has started'
]

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

{ #category : #'tests - result' }
ScenarioTest >> testRunningScenarioProducesResult [

	| result scenario |
	scenario := SampleFeature new scenarioNamed:
		            'Running a scenario'.
	result := scenario runWith: SampleStepDefinitions buildStepDefinitions.
	self assert: result resultCount equals: scenario steps size
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

{ #category : #'tests - result' }
ScenarioTest >> testScenarioStepsGetSkipped [

	| scenario result |
	scenario := SampleFeature new scenarioNamed:
		            'A scenario has one or more steps'.
	result := scenario runWith: SampleStepDefinitions buildStepDefinitions.
	self assert: result skippedCount equals: 2
]
