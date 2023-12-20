Class {
	#name : #ScenarioTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #'tests - steps' }
ScenarioTest >> testAddingStepToScenario [

	| scenario |
	scenario := Scenario title: 'My scenario' feature: Feature new.
	scenario addStep: #Given text: 'My app has started'.
	self
		assert: scenario steps first text equals: 'My app has started'
]

{ #category : #'tests - steps' }
ScenarioTest >> testNewlyCreatedScenarioHasNoSteps [

	| scenario |
	scenario := Scenario title: 'My scenario' feature: Feature new.
	self deny: scenario hasSteps
]

{ #category : #'tests - printing' }
ScenarioTest >> testPrintStringWithoutSteps [

	|newInstance|
	newInstance := Scenario title: 'My scenario' feature: Feature new.
	
	self assert: newInstance printString equals: 'Scenario: My scenario'

]

{ #category : #'tests - result' }
ScenarioTest >> testRunningScenarioProducesResult [

	| result scenario |
	scenario := SampleFeature new scenarioNamed:
		            'Running a scenario'.
	result := scenario runWith: SampleFeature new stepDefinitions.
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
ScenarioTest >> testScenarioHasTitle [

	| sampleScenario |
	sampleScenario := Scenario title: 'A scenario has one or more steps' feature: Feature new.
	self
		assert: sampleScenario title
		equals: 'A scenario has one or more steps'
]

{ #category : #'tests - result' }
ScenarioTest >> testScenarioStepsCanBePending [

	| scenario result |
	scenario := SampleFeature new scenarioNamed:
		            'A scenario can be pending'.
	result := scenario runWith:
		          SampleFeature new stepDefinitions.
	self assert: result pendingCount equals: 1
]

{ #category : #'tests - result' }
ScenarioTest >> testScenarioStepsGetSkipped [

	| scenario result |
	scenario := SampleFeature new scenarioNamed:
		            'A scenario has one or more steps'.
	result := scenario runWith:
		          SampleFeature new stepDefinitions.
	self assert: result skippedCount equals: 2
]
