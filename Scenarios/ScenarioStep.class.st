Class {
	#name : #ScenarioStep,
	#superclass : #Object,
	#instVars : [
		'type',
		'text'
	],
	#category : #Scenarios
}

{ #category : #'instance creation' }
ScenarioStep class >> type: aSymbol text: aString [ 
	^self new
		type: aSymbol text: aString;
		yourself
]

{ #category : #running }
ScenarioStep >> run: aScenarioResult with: stepDefinitions [

	[
	[
	self runStepWith: stepDefinitions.
	aScenarioResult addPass: self ]
		on: UndefinedStep
		do: [ :ex | aScenarioResult addUndefined: self. ex pass ] ]
		on: TestFailure , Error
		do: [ :ex | aScenarioResult addFailure: self. ex pass ]
]

{ #category : #running }
ScenarioStep >> runStepWith: stepDefinitions [ 
	| definition |
	definition := stepDefinitions detect: [ :each | each definition = text ] ifNone: [ UndefinedStep signal ].
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
ScenarioStep >> type [
	^ type
]

{ #category : #initialization }
ScenarioStep >> type: aSymbol text: aString [
	type := aSymbol.
	text := aString
	
]
