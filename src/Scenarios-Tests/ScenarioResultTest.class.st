Class {
	#name : #ScenarioResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Tests'
}

{ #category : #tests }
ScenarioResultTest >> testPrintingToString [

	| result |
	result := SampleFeature new run.
	self
		assert: result printString
		equals: '2 passed, 2 failed, 1 undefined.'
]
