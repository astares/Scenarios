"
The result of running a BDD scenario
"
Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'stepResults'
	],
	#category : #'Scenarios-Base'
}

{ #category : #adding }
ScenarioResult >> addResults: aCollectionOfSteps [

	^ stepResults addAll: aCollectionOfSteps
]

{ #category : #accessing }
ScenarioResult >> failed [

	^ stepResults select: [ :each | each isFailed ]
]

{ #category : #accessing }
ScenarioResult >> failedCount [

	^ self failed size
]

{ #category : #initialization }
ScenarioResult >> initialize [

	super initialize.
	stepResults := OrderedCollection new
]

{ #category : #accessing }
ScenarioResult >> passed [

	^ stepResults select: [ :each | each isPassed ]
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
		nextPutAll: ' undefined.'
]

{ #category : #accessing }
ScenarioResult >> resultCount [

	^ stepResults size
]

{ #category : #accessing }
ScenarioResult >> skipped [

	^ stepResults select: [ :each | each isSkipped ]
]

{ #category : #accessing }
ScenarioResult >> skippedCount [

	^ self skipped size
]

{ #category : #accessing }
ScenarioResult >> undefined [

	^ stepResults select: [ :each | each isUndefined ]
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ self undefined size
]
