"
A scenario is a written description of your products behavior from one or more users perspectives
"
Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'title',
		'steps',
		'stepRunner'
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

{ #category : #testing }
Scenario >> hasTitle [

	^ title isNotNil and: [ title isNotEmpty ]
]

{ #category : #initialization }
Scenario >> initialize [

	super initialize.
	steps := OrderedCollection new.
	self prepareToExecuteAllSteps
]

{ #category : #running }
Scenario >> prepareToExecuteAllSteps [

	stepRunner := self stepExecutionBehavior
]

{ #category : #running }
Scenario >> prepareToSkipAllSteps [

	^ stepRunner := self stepSkipBehavior
]

{ #category : #printing }
Scenario >> printOn: aStream [

	self hasTitle ifFalse: [ ^ super printOn: aStream ].
	
	aStream
		nextPutAll: 'Scenario: ';
		nextPutAll: self title
]

{ #category : #running }
Scenario >> run: aScenarioResult with: aCollectionOfStepDefinitions [
	"Run the scenario (receiver) by using the given object to store the result together with the given step definitions"

	steps do: [ :each |
		[
		stepRunner
			value: each
			value: aScenarioResult
			value: aCollectionOfStepDefinitions ]
			on: UndefinedStep , TestFailure , Error
			do: [ :ex | self prepareToSkipAllSteps ] ]
]

{ #category : #running }
Scenario >> runWith: aCollectionOfStepDefinitions [

	| result |
	result := ScenarioResult new.
	self run: result with: aCollectionOfStepDefinitions.
	^ result
]

{ #category : #running }
Scenario >> stepExecutionBehavior [

	^[:step :result :definitions | step
		          run: result
		          with: definitions ]
]

{ #category : #running }
Scenario >> stepSkipBehavior [

	^ [ :step :result :definitions | step skip: result ]
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

{ #category : #accessing }
Scenario >> title: aString [ 
	title := aString
]

{ #category : #steps }
Scenario >> when: aString [ 
	self addStep: #When text: aString
]
