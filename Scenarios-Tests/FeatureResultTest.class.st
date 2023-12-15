Class {
	#name : #FeatureResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
FeatureResultTest >> testPrintingToString [

	| result |
	result := TestFeature new run.
	self
		assert: result printString
		equals: '1 passed, 3 failed.'
]
