Class {
	#name : #SampleStepDefinitions,
	#superclass : #ScenarioStepDefinition,
	#category : #'Scenarios-Tests-Sample'
}

{ #category : #steps }
SampleStepDefinitions >> errorScenario [

	<Then: 'The scenario could raise an error'>
	self error: 'an error'
]

{ #category : #steps }
SampleStepDefinitions >> failingScenario [
	<Then: 'The scenario could fail'>
	self assert: false
]

{ #category : #steps }
SampleStepDefinitions >> featureWithOneScenario [
<Given: 'A feature with one scenario'>
]

{ #category : #steps }
SampleStepDefinitions >> runTheScenario [

	<When: 'The feature is run'>
	
]

{ #category : #steps }
SampleStepDefinitions >> verifyTheSteps [

	<Then: 'The scenario steps get verified'>
	
]
