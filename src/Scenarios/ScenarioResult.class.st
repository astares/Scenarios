"
The result of running a BDD scenario
"
Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'undefined',
		'passed',
		'failed',
		'skipped'
	],
	#category : #'Scenarios-Base'
}

{ #category : #adding }
ScenarioResult >> addFailure: aScenario [

	failed add: aScenario
]

{ #category : #running }
ScenarioResult >> addPass: aScenario [

	passed add: aScenario
]

{ #category : #running }
ScenarioResult >> addSkipped: aScenario [

	skipped add: aScenario
]

{ #category : #running }
ScenarioResult >> addUndefined: aScenario [

	undefined add: aScenario
]

{ #category : #accessing }
ScenarioResult >> failedCount [

	^ failed size
]

{ #category : #initialization }
ScenarioResult >> initialize [

	super initialize.
	undefined := OrderedCollection new.
	passed := OrderedCollection new.
	failed := OrderedCollection new.
	skipped := OrderedCollection new
]

{ #category : #accessing }
ScenarioResult >> passedCount [

	^ passed size
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

	^ undefined size + passed size + failed size + skipped size
]

{ #category : #accessing }
ScenarioResult >> skippedCount [

	^ skipped size
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ undefined size
]
