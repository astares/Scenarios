Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'scenario',
		'results'
	],
	#category : #Scenarios
}

{ #category : #'instance creation' }
ScenarioResult class >> scenario: aScenario [

	^self new scenario: aScenario; yourself
]

{ #category : #adding }
ScenarioResult >> addResults: aCollectionOfSteps [

	^ results addAll: aCollectionOfSteps
]

{ #category : #accessing }
ScenarioResult >> failedCount [

	^ (results select: [ :each | each isFailed ]) size
]

{ #category : #testing }
ScenarioResult >> isPassed [

	^results allSatisfy: [ :each | each isPassed ]
]

{ #category : #accessing }
ScenarioResult >> passedCount [

	^ (results select: [ :each | each isPassed ]) size
]

{ #category : #printing }
ScenarioResult >> printOn: aStream [

	aStream
		nextPutAll: self passedCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedCount asString;
		nextPutAll: ' failed, ';
		nextPutAll: self undefinedCount asString;
		nextPutAll: ' undefined, ';
		nextPutAll: self skippedCount asString;
		nextPutAll: ' skipped.'
]

{ #category : #accessing }
ScenarioResult >> resultCount [

	^ results size
]

{ #category : #accessing }
ScenarioResult >> scenario: aScenario [

	results := OrderedCollection new.
	scenario := aScenario
]

{ #category : #accessing }
ScenarioResult >> skippedCount [

	^ (results select: [ :each | each isSkipped ]) size
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ (results select: [ :each | each isUndefined ]) size
]
