"
A ScenarioStepTest is a test class for testing the behavior of ScenarioStep
"
Class {
	#name : #ScenarioStepTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #tests }
ScenarioStepTest >> testInstanceCreation [

	| step |
	step := ScenarioStep type: #Given text: 'My app has started'.
	self
		assert: step type identicalTo: #Given;
		assert: step text equals: 'My app has started'
]

{ #category : #tests }
ScenarioStepTest >> testNewStepIsNotRun [

	| step |
	step := ScenarioStep type: #Given text: 'A sample step'.
	self assert: step wasNotRun
]

{ #category : #'tests - printing' }
ScenarioStepTest >> testPrintingToString [

	| step |
	step := ScenarioStep type: #Given text: 'My app has started'.

	self assert: step printString equals: 'Given My app has started'
]
