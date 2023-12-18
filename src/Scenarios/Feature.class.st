"
A Feature represents a distinct aspect of the system’s functionality, which can provide value to a user. Features are usually written from the perspective of a user role.

Each feature contains one or many scenarios that describe its behaviors
"
Class {
	#name : #Feature,
	#superclass : #Object,
	#instVars : [
		'scenarios',
		'scenario',
		'stepDefinitions'
	],
	#category : #'Scenarios-Base'
}

{ #category : #testing }
Feature class >> isAbstract [

	^ self == Feature
]

{ #category : #testing }
Feature class >> isFeature [

	^ self isAbstract not
]

{ #category : #building }
Feature >> build [

	^ self
		buildScenarios;
		buildStepDefinitions
]

{ #category : #'private - building' }
Feature >> buildScenarioFromMethod: aMethod [

	| newScenario |
	newScenario := Scenario title: (aMethod pragmaAt: #Scenario:) arguments first.
	self withScenario: newScenario do: [ self perform: aMethod selector ].
	^newScenario
]

{ #category : #'private - building' }
Feature >> buildScenarios [

	scenarios := OrderedCollection new.
	self class methods do: [ :each |
		(each hasPragmaNamed: #Scenario:) ifTrue: [
			scenarios add: (self buildScenarioFromMethod: each) ] ]
]

{ #category : #'private - building' }
Feature >> buildStepDefinitions [
	stepDefinitions := OrderedCollection new.
	(Smalltalk organization classesInCategory: self class category) do: [:each | (each inheritsFrom: ScenarioStepDefinition) ifTrue: [ stepDefinitions addAll: (each buildStepDefinitions) ] ]
]

{ #category : #keywords }
Feature >> given: aString [

	scenario given: aString
]

{ #category : #running }
Feature >> run [

	| result |
	result := FeatureResult new.
	self run: result.
	^ result
]

{ #category : #running }
Feature >> run: aFeatureResult [
	"Run the feature (receiver) by using the given object to store the result"

	self scenarios do: [:each | | result |
		result := ScenarioResult new.
		aFeatureResult addResult: result.
		each run: result with: self stepDefinitions.
		]
]

{ #category : #querying }
Feature >> scenarioNamed: aString [

	^ self scenarios
		  detect: [ :each | each title = aString ]
		  ifNone: [  ]
]

{ #category : #accessing }
Feature >> scenarios [

	scenarios ifNil: [ self buildScenarios ].
	^ scenarios
]

{ #category : #accessing }
Feature >> stepDefinitions [

	stepDefinitions ifNil: [ self buildStepDefinitions ].
	^ stepDefinitions
]

{ #category : #keywords }
Feature >> then: aString [

	scenario then: aString
]

{ #category : #keywords }
Feature >> when: aString [

	scenario when: aString
]

{ #category : #private }
Feature >> withScenario: aScenario do: aBlock [

	[ scenario := aScenario.
	  aBlock value ] ensure: [ scenario := nil ]
]
