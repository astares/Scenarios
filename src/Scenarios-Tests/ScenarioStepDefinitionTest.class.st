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
	definitions := SampleFeature new
							buildStepDefinitions;
							stepDefinitions.
	
	self 
		assert: definitions isNotEmpty;
		assert: definitions size identicalTo: 5
]

{ #category : #'tests - other' }
ScenarioStepDefinitionTest >> testShouldBeAbstractClass [
	"ScenarioStepDefinition should be an abstract class that is subclassed"
		
	self assert: ScenarioStepDefinition isAbstract
]
