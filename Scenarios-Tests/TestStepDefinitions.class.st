Class {
	#name : #TestStepDefinitions,
	#superclass : #ScenarioStepDefinition,
	#category : #'Scenarios-Tests'
}

{ #category : #steps }
TestStepDefinitions >> errorScenario [

	<Then: 'The scenario could raise an error'>
	self error: 'an error'
]

{ #category : #steps }
TestStepDefinitions >> failingScenario [
	<Then: 'The scenario could fail'>
	self assert: false
]

{ #category : #steps }
TestStepDefinitions >> featureWithOneScenario [
<Given: 'A feature with one scenario'>
]

{ #category : #steps }
TestStepDefinitions >> runTheScenario [

	<When: 'The feature is run'>
	
]

{ #category : #steps }
TestStepDefinitions >> verifyTheSteps [

	<Then: 'The scenario steps get verified'>
	
]
