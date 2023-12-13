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
			assert: step hasType;
			assert: step hasText.
			
	self 		
		assert: step type identicalTo: #Given;
		assert: step type isSymbol;		
		assert: step text equals: 'My app has started'
	
	

]

{ #category : #'tests - printing' }
ScenarioStepTest >> testPrintString [

	| step |
	step := ScenarioStep type: #Given text: 'My app has started'.
	
	self 
		assert: step printString equals: 'Given My app has started'
	
]

{ #category : #'tests - printing' }
ScenarioStepTest >> testPrintStringWithoutTitleAndText [

	self assert: ScenarioStep new printString equals: 'a ScenarioStep'
]
