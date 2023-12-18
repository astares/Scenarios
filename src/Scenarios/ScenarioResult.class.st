"
The result of running a BDD scenario
"
Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'scenario',
		'results'
	],
	#category : #'Scenarios-Base'
}

{ #category : #'instance creation' }
ScenarioResult class >> scenario: aScenario [

	^ self new
		  scenario: aScenario;
		  yourself
]

{ #category : #adding }
ScenarioResult >> addResults: aCollectionOfSteps [

	^ results addAll: aCollectionOfSteps
]

{ #category : #accessing }
ScenarioResult >> failed [

	^ results select: [ :each | each isFailed ]
]

{ #category : #accessing }
ScenarioResult >> failedCount [

	^ self failed size
]

{ #category : #initialization }
ScenarioResult >> initialize [

	super initialize.
	results := OrderedCollection new
]

{ #category : #testing }
ScenarioResult >> isPassed [

	^ results allSatisfy: [ :each | each isPassed ]
]

{ #category : #accessing }
ScenarioResult >> passed [

	^ results select: [ :each | each isPassed ]
]

{ #category : #accessing }
ScenarioResult >> passedCount [

	^ self passed size
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
ScenarioResult >> skipped [

	^ results select: [ :each | each isSkipped ]
]

{ #category : #accessing }
ScenarioResult >> skippedCount [

	^ self skipped size
]

{ #category : #accessing }
ScenarioResult >> undefined [

	^ results select: [ :each | each isUndefined ]
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ self undefined size
]
