"
A FeatureResultTest is a test class for testing the behavior of FeatureResult
"
Class {
	#name : #FeatureResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #tests }
FeatureResultTest >> testPrintingToString [

	| result |
	result := SampleFeature new run.
	self
		assert: result printString
		equals: '1 passed, 3 failed.'
]
