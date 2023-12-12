Class {
	#name : #FeatureTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
FeatureTest >> testFeatureHasScenarios [

	| feature |
	feature := TestFeature new.
	self assert: (feature scenarios anySatisfy: [ :each | each title = 'A scenario has a title' ])
]

{ #category : #tests }
FeatureTest >> testRunningFeatureProducesResult [

	| feature result |
	feature := TestFeature new.
	result := feature run.
	self assert: result resultCount equals: feature scenarios size
]

{ #category : #tests }
FeatureTest >> testScenariosCouldFail [

	| feature result |
	feature := TestFeature new.
	result := feature run.
	self assert: result failedCount equals: 2
]
