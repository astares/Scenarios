Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'stepResults'
	],
	#category : #Scenarios
}

{ #category : #adding }
ScenarioResult >> addResults: aCollectionOfSteps [

	^ stepResults addAll: aCollectionOfSteps
]

{ #category : #accessing }
ScenarioResult >> failedCount [

	^ (stepResults select: [ :each | each isFailed ]) size
]

{ #category : #initialization }
ScenarioResult >> initialize [

	stepResults := OrderedCollection new
]

{ #category : #accessing }
ScenarioResult >> passedCount [

	^ (stepResults select: [ :each | each isPassed ]) size
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

	^ (stepResults select: [ :each | each isSkipped ]) size
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ (stepResults select: [ :each | each isUndefined ]) size
]
