Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'title',
		'steps'
	],
	#category : #Scenarios
}

{ #category : #'instance creation' }
Scenario class >> title: aString [ 
	^self new title: aString; yourself
]

{ #category : #steps }
Scenario >> addStep: aSymbol text: aString [ 
	steps add: (ScenarioStep type: aSymbol text: aString)
]

{ #category : #steps }
Scenario >> given: aString [ 
	self addStep: #Given text: aString 
]

{ #category : #initialization }
Scenario >> initialize [
	steps := OrderedCollection new
]

{ #category : #running }
Scenario >> run: aScenarioResult with: aCollectionOfStepDefinitions [

	| shouldRun |
	shouldRun := true.
	steps do: [ :each |
		[shouldRun ifTrue: [each run: aScenarioResult with: aCollectionOfStepDefinitions] ifFalse: [ each skip: aScenarioResult ]]
			on: UndefinedStep, TestFailure, Error do: [ :ex | shouldRun := false ] ]
]

{ #category : #running }
Scenario >> runWith: aCollectionOfStepDefinitions [

	| result |
	result := ScenarioResult new.
	self run: result with: aCollectionOfStepDefinitions.
	^ result
]

{ #category : #accessing }
Scenario >> steps [
	^steps
]

{ #category : #steps }
Scenario >> then: aString [ 
	self addStep: #Then text: aString.
]

{ #category : #accessing }
Scenario >> title [
	^ title
]

{ #category : #initialization }
Scenario >> title: aString [ 
	title := aString
]

{ #category : #steps }
Scenario >> when: aString [ 
	self addStep: #When text: aString
]
