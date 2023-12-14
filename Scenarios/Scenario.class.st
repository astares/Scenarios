Class {
	#name : #Scenario,
	#superclass : #Object,
	#instVars : [
		'title',
		'steps',
		'stepRunner'
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

{ #category : #running }
Scenario >> run: aScenarioResult with: aCollectionOfStepDefinitions [

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

^[ :step :result :definitions | step
		          run: result
		          with: definitions ]
]

{ #category : #running }
Scenario >> stepSkipBehavior [
^[ :step :result :definitions | step skip: result ]
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
