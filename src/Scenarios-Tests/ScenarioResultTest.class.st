Class {
	#name : #ScenarioResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #tests }
ScenarioResultTest >> testPrintString [

	self assert: ScenarioResult new printString equals: '0 passed, 0 failed, 0 undefined, 0 skipped.'
]

{ #category : #'tests - sample data' }
ScenarioResultTest >> testPrintStringForSample [

	| result |
	result := SampleFeature new run.
	self
		assert: result printString
		equals: '1 passed, 3 failed.'
]

{ #category : #tests }
ScenarioResultTest >> testPrintingToString [

	| result scenario |
	scenario := SampleFeature new scenarioNamed: 'Running a scenario'.
	result := scenario runWith: SampleStepDefinitions buildStepDefinitions.
	self
		assert: result printString
		equals: '3 passed, 0 failed, 0 undefined, 0 skipped.'
]

{ #category : #tests }
ScenarioResultTest >> testinstanceCreation [

	|newInstance|
	newInstance := ScenarioResult new.

	self 
		assert: newInstance passedCount equals: 0;
		assert: newInstance failedCount equals: 0;
		assert: newInstance undefinedCount equals: 0.
	
	self assert: newInstance resultCount equals: 0
			
		
]
