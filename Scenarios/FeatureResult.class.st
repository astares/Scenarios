Class {
	#name : #FeatureResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #Scenarios
}

{ #category : #adding }
FeatureResult >> addResult: aScenarioResult [

	^results add: aScenarioResult
]

{ #category : #accessing }
FeatureResult >> failedCount [

	^(results reject: [ :each | each isPassed ]) size
]

{ #category : #initialization }
FeatureResult >> initialize [

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

	^results size
]
