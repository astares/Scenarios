Class {
	#name : #FeatureResultTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
FeatureResultTest >> testPrintingToString [

	| result expected |
	expected := '4 scenarios (1 passed, 3 failed)' , String cr
	            , '12 steps (7 passed, 2 failed, 1 undefined, 2 skipped)'.
	result := TestFeature new run.
	self assert: result printString equals: expected
]
