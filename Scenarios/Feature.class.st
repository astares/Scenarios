Class {
	#name : #Feature,
	#superclass : #Object,
	#instVars : [
		'result',
		'scenarios',
		'scenario',
		'stepDefinitions'
	],
	#category : #'Scenarios-Base'
}

{ #category : #running }
Feature >> buildScenarioFromMethod: aMethod [

	| newScenario |
	newScenario := Scenario title: (aMethod pragmaAt: #Scenario:) arguments first.
	self withScenario: newScenario do: [ self perform: aMethod selector ].
	^newScenario
	
]

{ #category : #running }
Feature >> buildScenarios [

	scenarios := OrderedCollection new.
	self class methods do: [ :each | 
		(each hasPragmaNamed: #Scenario:) ifTrue: [ 
			scenarios add: (self buildScenarioFromMethod: each) ] ]
]

{ #category : #running }
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

	result := ScenarioResult new.
	self run: result.
	^ result
]

{ #category : #running }
Feature >> run: aScenarioResult [ 
	self scenarios do: [:each | each run: aScenarioResult with: self stepDefinitions].
]

{ #category : #querying }
Feature >> scenarioNamed: aString [ 
	^ self scenarios detect: [ :each | each title = aString ] ifNone: [  ]
]

{ #category : #accessing }
Feature >> scenarios [

	scenarios ifNil: [ self buildScenarios ].
	^scenarios
]

{ #category : #accessing }
Feature >> stepDefinitions [
	stepDefinitions ifNil: [self buildStepDefinitions].
	^stepDefinitions
]

{ #category : #keywords }
Feature >> then: aString [ 
	scenario then: aString
]

{ #category : #keywords }
Feature >> when: aString [ 
	scenario when: aString.
]

{ #category : #private }
Feature >> withScenario: aScenario do: aBlock [ 
	[scenario := aScenario.
	aBlock value] ensure: [ scenario := nil ]
]
