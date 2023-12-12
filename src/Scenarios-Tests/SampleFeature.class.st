Class {
	#name : #SampleFeature,
	#superclass : #Feature,
	#category : #'Scenarios-Tests-Sample'
}

{ #category : #scenarios }
SampleFeature >> featureGetsRun [
	<Scenario: 'Running a scenario'>
	
	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario steps get verified'
]

{ #category : #scenarios }
SampleFeature >> scenarioCanFail [
	<Scenario: 'A scenario can fail'>

	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario could fail'
]

{ #category : #scenarios }
SampleFeature >> scenarioCanFailWithError [
	<Scenario: 'A scenario can fail with an error'>
	
	self
		given: 'A feature with one scenario';
		when: 'The feature is run';
		then: 'The scenario could raise an error'
]

{ #category : #scenarios }
SampleFeature >> scenarioHasSteps [
	<Scenario: 'A scenario has one or more steps'>
	
	self
		given: 'A scenario with steps';
		when: 'A Scenario object gets created from it';
		then: 'The Scenario object has all the steps'
]

{ #category : #scenarios }
SampleFeature >> scenarioHasTitle [
	<Scenario: 'A scenario has a title'>
]
