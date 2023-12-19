Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'title',
		'steps'
	],
	#category : #Scenarios
}

{ #category : #initialization }
Scenario >> initialize [

	steps := OrderedCollection new
]

{ #category : #running }
Scenario >> run: aScenarioResult with: aCollectionOfStepDefinitions [

	aScenarioResult addResults: steps.
	steps do: [ :each |
		[ each run: aScenarioResult with: aCollectionOfStepDefinitions ]
			on: UndefinedStep , TestFailure , Error
			do: [ :ex | ^ self ] ]
]

{ #category : #running }
Scenario >> runWith: aCollectionOfStepDefinitions [

	| result |
	result := ScenarioResult scenario: self.
	self run: result with: aCollectionOfStepDefinitions.
	^ result
]
