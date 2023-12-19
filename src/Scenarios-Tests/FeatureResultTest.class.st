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

	| result expected |
	expected := '5 scenarios (1 passed, 1 pending, 3 failed)' , String cr
	            , '15 steps (9 passed, 2 failed, 1 undefined, 1 pending, 2 skipped)'.
	result := SampleFeature new run.
	self assert: result printString equals: expected
]
