"
A scenario step is a component of a scenario that describes a specific action, condition, or outcome. Each scenario is made up of one or more steps, and each step starts with a keyword like Given, When, Then, And, But
"
Class {
	#name : #ScenarioStep,
	#superclass : #Object,
	#instVars : [
		'type',
		'text'
	],
	#category : #'Scenarios-Base'
}

{ #category : #'instance creation' }
ScenarioStep class >> type: aSymbol text: aString [ 
	^self new
		type: aSymbol text: aString;
		yourself
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
	text := aString
	
]
