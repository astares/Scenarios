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
ScenarioResult >> addResult: aStep [

	^ stepResults add: aStep
]

{ #category : #adding }
ScenarioResult >> addResults: aCollectionOfSteps [

	^ stepResults addAll: aCollectionOfSteps
]

{ #category : #accessing }
ScenarioResult >> failedCount [

	^ (stepResults select: [ :each | each result == #failed ]) size
]

{ #category : #initialization }
ScenarioResult >> initialize [

	super initialize.
	stepResults := OrderedCollection new
]

{ #category : #accessing }
ScenarioResult >> passedCount [

	^ (stepResults select: [ :each | each result == #passed ]) size
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
ScenarioResult >> skippedCount [

	^ (stepResults select: [ :each | each result == #notRun ]) size
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ (stepResults select: [ :each | each result == #undefined ]) size
]
