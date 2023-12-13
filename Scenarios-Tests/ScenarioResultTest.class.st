Class {
	#name : #ScenarioResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
ScenarioResultTest >> testPrintingToString [

	| result |
	result := TestFeature new run.
	self
		assert: result printString
		equals: '7 passed, 2 failed, 3 undefined.'
]
