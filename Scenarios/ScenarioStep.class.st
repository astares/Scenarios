Class {
	#name : #ScenarioStep,
	#superclass : #Object,
	#instVars : [
		'type',
		'text',
		'result'
	],
	#category : #Scenarios
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

{ #category : #accessing }
ScenarioStep >> result [
	^result
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
	definition := stepDefinitions detect: [ :each | each definition = text ] ifNone: [ UndefinedStep signal ].
	definition valueWith: text
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
	text := aString.
	self beNotRun
]
