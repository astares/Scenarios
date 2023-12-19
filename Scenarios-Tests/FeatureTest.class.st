Class {
	#name : #FeatureTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
FeatureTest >> testFeatureHasScenarios [

	| feature |
	feature := TestFeature new.
	self assert: (feature scenarioNamed: 'A Scenario has one or more steps') notNil
]

{ #category : #tests }
FeatureTest >> testScenariosCouldFail [

	| feature result |
	feature := TestFeature new.
	result := feature run.
	self assert: result failedCount isZero not
]
