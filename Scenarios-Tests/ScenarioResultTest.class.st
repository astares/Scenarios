Class {
	#name : #ScenarioResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
ScenarioResultTest >> testPrintingToString [

	| result scenario |
	scenario := TestFeature new scenarioNamed: 'Running a scenario'.
	result := scenario runWith: TestStepDefinitions buildStepDefinitions.
	self
		assert: result printString
		equals: '3 passed, 0 failed, 0 undefined, 0 skipped.'
]
