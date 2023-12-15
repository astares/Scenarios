Class {
	#name : #ScenarioStepTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests'
}

{ #category : #tests }
ScenarioStepTest >> testNewStepIsNotRun [

	| step |
	step := ScenarioStep type: #Given text: 'A sample step'.
	self assert: step wasNotRun
]
