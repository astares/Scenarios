Class {
	#name : #ScenarioResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #tests }
ScenarioResultTest >> testCreatingInstance [

	|newInstance|
	newInstance := ScenarioResult scenario: Scenario new.
	self 
		assert: newInstance resultCount isZero		
		
]

{ #category : #tests }
ScenarioResultTest >> testPrintEmptyResultToString [

	self
		assert: (ScenarioResult scenario: Scenario new) printString
		equals: '0 passed, 0 failed, 0 undefined, 0 pending, 0 skipped.'
]

{ #category : #tests }
ScenarioResultTest >> testPrintingToString [

	| result scenario |
	scenario := SampleFeature new scenarioNamed: 'Running a scenario'.
	result := scenario run.
	self
		assert: result printString
		equals: '3 passed, 0 failed, 0 undefined, 0 pending, 0 skipped.'
]
