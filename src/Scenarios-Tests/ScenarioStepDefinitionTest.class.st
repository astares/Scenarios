"
A ScenarioStepDefinitionTest is a test class for testing the behavior of ScenarioStepDefinition
"
Class {
	#name : #ScenarioStepDefinitionTest,
	#superclass : #TestCase,
	#category : #'Scenarios-Tests-Base'
}

{ #category : #'tests - samples' }
ScenarioStepDefinitionTest >> testSampleStepDefinitions [

	| definitions |
	definitions := SampleFeature new stepDefinitions.
	self 
		assert: (definitions anySatisfy: [ :each | each definition = 'A feature with one scenario' ])
]
