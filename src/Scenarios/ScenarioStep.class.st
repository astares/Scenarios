"
A scenario step is a component of a scenario that describes a specific action, condition, or outcome. Each scenario is made up of one or more steps, and each step starts with a keyword like Given, When, Then, And, But
"
Class {
	#name : #ScenarioStep,
	#superclass : #Object,
	#instVars : [
		'type',
		'text',
		'result'
	],
	#category : #'Scenarios-Base'
}

{ #category : #'instance creation' }
ScenarioStep class >> type: aSymbol text: aString [ 
	^self new
		type: aSymbol text: aString;
		yourself
]

{ #category : #results }
ScenarioStep >> beFailed [

	result := #failed
]

{ #category : #results }
ScenarioStep >> beNotRun [

	result := #notRun
]

{ #category : #results }
ScenarioStep >> bePassed [

	result := #passed
]

{ #category : #results }
ScenarioStep >> beUndefined [

	result := #undefined
]

{ #category : #testing }
ScenarioStep >> hasText [ 

	^ text isNotNil and: [ text isNotEmpty ]
]

{ #category : #testing }
ScenarioStep >> hasType [

	^ type isSymbol
]

{ #category : #printing }
ScenarioStep >> printOn: aStream [

	self hasType ifFalse: [ ^ super printOn: aStream ].
	self hasText ifFalse: [ ^ super printOn: aStream ].	
		
	aStream
		nextPutAll: self type asString;
		space;
		nextPutAll: self text
]

{ #category : #accessing }
ScenarioStep >> result [

	^ result
]

{ #category : #running }
ScenarioStep >> run: aScenarioResult with: stepDefinitions [

	[
	[
	self runStepWith: stepDefinitions.
	self bePassed ]
		on: UndefinedStep
		do: [ :ex |
			self beUndefined.
			ex pass ] ]
		on: TestFailure , Error
		do: [ :ex |
			self beFailed.
			ex pass ]
]

{ #category : #running }
ScenarioStep >> runStepWith: stepDefinitions [

	| definition |
	definition := stepDefinitions
		              detect: [ :each | each definition = text ]
		              ifNone: [ UndefinedStep signal ].
	definition valueWith: text
]

{ #category : #running }
ScenarioStep >> skip: aScenarioResult [

	aScenarioResult addSkipped: self
]

{ #category : #accessing }
ScenarioStep >> text [
	^ text
]

{ #category : #accessing }
ScenarioStep >> text: anObject [

	text := anObject
]

{ #category : #accessing }
ScenarioStep >> type [
	^ type
]

{ #category : #accessing }
ScenarioStep >> type: anObject [

	type := anObject
]

{ #category : #'private - initialization' }
ScenarioStep >> type: aSymbol text: aString [

	type := aSymbol.
	text := aString.

	self beNotRun
]
