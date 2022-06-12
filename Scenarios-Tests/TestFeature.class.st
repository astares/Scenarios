Class {
	#name : #TestFeature,
	#superclass : #Feature,
	#category : #'Scenarios-Tests'
}

{ #category : #scenarios }
TestFeature >> featureGetsRun [

	<Scenario: 'Running a scenario'>
	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario steps get verified'
]

{ #category : #scenarios }
TestFeature >> scenarioHasSteps [

	<Scenario: 'A Scenario has one or more steps'>
	self
		given: 'A scenario with steps';
		when: 'A Scenario object gets created from it';
		then: 'The Scenario object has all the steps'
]

{ #category : #scenarios }
TestFeature >> scenarioHasTitle [

	<Scenario: 'A Scenario has a title'>
]
