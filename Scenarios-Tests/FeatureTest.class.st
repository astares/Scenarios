Class {
	#name : #FeatureTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Tests'
}

{ #category : #tests }
FeatureTest >> testFeatureHasScenarios [

	| feature |
	feature := SampleFeature new.
	self assert: (feature scenarios anySatisfy: [ :each | each title = 'A scenario has a title' ])
]

{ #category : #tests }
FeatureTest >> testRunningFeatureProducesResult [

	| feature result |
	feature := SampleFeature new.
	result := feature run.
	self assert: result resultCount equals: feature scenarios size
]

{ #category : #tests }
FeatureTest >> testScenariosCouldFail [

	| feature result |
	feature := SampleFeature new.
	result := feature run.
	self assert: result failedCount equals: 2
]
