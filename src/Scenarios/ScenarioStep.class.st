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

{ #category : #constants }
ScenarioStep class >> failedResult [

	^ #failed
]

{ #category : #constants }
ScenarioStep class >> notRunResult [

	^ #notRun
]

{ #category : #constants }
ScenarioStep class >> passedResult [

	^ #passed
]

{ #category : #constants }
ScenarioStep class >> pendingResult [

	^ #pending
]

{ #category : #'instance creation' }
ScenarioStep class >> type: aSymbol text: aString [ 
	^self new
		type: aSymbol text: aString;
		yourself
]

{ #category : #constants }
ScenarioStep class >> undefinedResult [

	^ #undefined
]

{ #category : #results }
ScenarioStep >> beFailed [

	result := self class failedResult
]

{ #category : #results }
ScenarioStep >> beNotRun [

	result := self class notRunResult
]

{ #category : #results }
ScenarioStep >> bePassed [

	result := self class passedResult
]

{ #category : #results }
ScenarioStep >> bePending [

	result := self class pendingResult
]

{ #category : #results }
ScenarioStep >> beUndefined [

	result := self class undefinedResult
]

{ #category : #testing }
ScenarioStep >> isFailed [

	^ result == self class failedResult
]

{ #category : #testing }
ScenarioStep >> isPassed [

	^ result == self class passedResult
]

{ #category : #testing }
ScenarioStep >> isPending [

	^ result == self class pendingResult
]

{ #category : #testing }
ScenarioStep >> isSkipped [

	^ result == self class notRunResult
]

{ #category : #testing }
ScenarioStep >> isUndefined [

	^ result == self class undefinedResult
]

{ #category : #printing }
ScenarioStep >> printOn: aStream [

	aStream
		nextPutAll: self type asString;
		space;
		nextPutAll: (self text ifNil: [ '' ])
]

{ #category : #running }
ScenarioStep >> run: aScenarioResult with: stepDefinitions [

	[  
	[
	[
	self runStepWith: stepDefinitions.
	self bePassed ]
		on: UndefinedStep
		do: [ :ex |
			self beUndefined.
			ex pass ] ] on: PendingStep do: [:ex | self bePending. ex pass]]
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

{ #category : #accessing }
ScenarioStep >> text [
	^ text
]

{ #category : #accessing }
ScenarioStep >> type [
	^ type
]

{ #category : #'private - initialization' }
ScenarioStep >> type: aSymbol text: aString [

	type := aSymbol.
	text := aString.

	self beNotRun
]

{ #category : #testing }
ScenarioStep >> wasNotRun [

	^ result == self class notRunResult
]
