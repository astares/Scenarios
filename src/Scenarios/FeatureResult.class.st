"
A feature result to capture results for a feature separately from those of a scenario
"
Class {
	#name : #FeatureResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #'Scenarios-Base'
}

{ #category : #adding }
FeatureResult >> addResult: aScenarioResult [

	^ results add: aScenarioResult
]

{ #category : #accessing }
FeatureResult >> failedCount [

	^ (results reject: [ :each | each isPassed ]) size
]

{ #category : #initialization }
FeatureResult >> initialize [

	super initialize.
	results := OrderedCollection new
]

{ #category : #accessing }
FeatureResult >> passedCount [

	^(results select: [ :each | each isPassed ]) size
]

{ #category : #printing }
FeatureResult >> printOn: aStream [

	aStream
		nextPutAll: self passedCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedCount asString;
		nextPutAll: ' failed.'
]

{ #category : #accessing }
FeatureResult >> resultCount [

	^ results size
]
