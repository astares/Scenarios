Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'undefined',
		'passed',
		'failed'
	],
	#category : #Scenarios
}

{ #category : #adding }
ScenarioResult >> addFailure: aScenario [ 
	failed add: aScenario.
]

{ #category : #running }
ScenarioResult >> addPass: aScenario [ 
	passed add: aScenario.
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

	undefined := OrderedCollection new.
	passed := OrderedCollection new.
	failed := OrderedCollection new
]

{ #category : #accessing }
ScenarioResult >> passedCount [

	^ passed size
]

{ #category : #accessing }
ScenarioResult >> resultCount [

	^ undefined size + passed size + failed size
]

{ #category : #running }
ScenarioResult >> runScenario: aScenario with: aCollectionOfStepDefitions [

	[
	[
	aScenario runScenarioWith: aCollectionOfStepDefitions.
	self addPass: aScenario ]
		on: UndefinedStep
		do: [ :ex | self addUndefined: aScenario ] ]
		on: TestFailure , Error
		do: [ self addFailure: aScenario ]
]

{ #category : #accessing }
ScenarioResult >> undefinedCount [

	^ undefined size
]
