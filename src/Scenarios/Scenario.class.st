"
A scenario is a written description of your products behavior from one or more users perspectives
"
Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'title',
		'steps'
	],
	#category : #'Scenarios-Base'
}

{ #category : #'instance creation' }
Scenario class >> title: aString [

	^ self new
		  title: aString;
		  yourself
]

{ #category : #steps }
Scenario >> addStep: aSymbol text: aString [

	steps add: (ScenarioStep type: aSymbol text: aString)
]

{ #category : #steps }
Scenario >> given: aString [

	self addStep: #Given text: aString
]

{ #category : #testing }
Scenario >> hasSteps [

	^ steps isNotEmpty
]

{ #category : #initialization }
Scenario >> initialize [ 

	super initialize.
	steps := OrderedCollection new
]

{ #category : #printing }
Scenario >> printOn: aStream [

	aStream
		nextPutAll: 'Scenario: ';
		nextPutAll: self title asString
]

{ #category : #running }
Scenario >> run: aScenarioResult with: aCollectionOfStepDefinitions [
	"Run the scenario (receiver) by using the given object to store the result together with the given step definitions"

	aScenarioResult addResults: steps.
	steps do: [ :each |
		[ each run: aScenarioResult with: aCollectionOfStepDefinitions ]
			on: UndefinedStep , PendingStep, TestFailure , Error
			do: [ :ex | ^ self ] ]
]

{ #category : #running }
Scenario >> runWith: aCollectionOfStepDefinitions [

	| result |
	result := ScenarioResult scenario: self.
	self run: result with: aCollectionOfStepDefinitions.
	^ result
]

{ #category : #accessing }
Scenario >> steps [

	^ steps
]

{ #category : #steps }
Scenario >> then: aString [ 
	self addStep: #Then text: aString.
]

{ #category : #comparision }
Scenario >> threeWayCompareTo: aScenario [

	^ self title threeWayCompareTo: aScenario title
]

{ #category : #accessing }
Scenario >> title [
	^ title
]

{ #category : #initialization }
Scenario >> title: aString [

	title := aString.
	steps := OrderedCollection new
]

{ #category : #steps }
Scenario >> when: aString [ 
	self addStep: #When text: aString
]
