Class {
	#name : #ScenarioResult,
	#superclass : #Object,
	#instVars : [
		'undefined',
		'passed'
	],
	#category : #Scenarios
}

{ #category : #running }
ScenarioResult >> addPass: aScenario [ 
	passed add: aScenario.
]

{ #category : #running }
ScenarioResult >> addUndefined: aScenario [ 
	undefined add: aScenario
]

{ #category : #initialization }
ScenarioResult >> initialize [

	undefined := OrderedCollection new.
	passed := OrderedCollection new
]

{ #category : #accessing }
ScenarioResult >> resultCount [
	^ undefined size + passed size
]

{ #category : #running }
ScenarioResult >> runScenario: aScenario with: aCollectionOfStepDefitions [ 
	[aScenario runScenarioWith: aCollectionOfStepDefitions.
	self addPass: aScenario] on: UndefinedStep do: [ :ex | self addUndefined: aScenario ]

]
