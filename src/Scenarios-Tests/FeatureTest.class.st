Class {
	#name : #FeatureTest,
	#superclass : #TestCase,
	#instVars : [
		'feature',
		'result'
	],
	#category : #'Scenarios-Tests-Base'
}

{ #category : #running }
FeatureTest >> setUp [

	super setUp.
	feature := SampleFeature new.
	result := feature run
]

{ #category : #tests }
FeatureTest >> testFeatureHasScenarios [

	self assert: (feature scenarios anySatisfy: [ :each |
			 each title = 'A scenario has a title' ])
]

{ #category : #'tests - other' }
FeatureTest >> testIsFeature [
	"Feature should be a feature"

	self assert: Feature isFeature.
	self deny: Object isFeature
]

{ #category : #tests }
FeatureTest >> testRunningFeatureProducesResult [
	
	self assert: result resultCount equals: feature scenarios size
]

{ #category : #tests }
FeatureTest >> testScenariosCouldFail [
	 
	self assert: result failedCount equals: 2
]

{ #category : #'tests - other' }
FeatureTest >> testShouldBeAbstractClass [
	"Feature should be an abstract class that is subclassed"
		
	self assert: Feature isAbstract
]
