"
Basic scenarios for running features
"
Class {
	#name : #RunningFeatureFeature,
	#superclass : #Feature,
	#category : #'Scenarios-Features'
}

{ #category : #scenarios }
RunningFeatureFeature >> runningFeatureRunsAllScenarios [

	<Scenario: 'Running a feature runs all its scenarios'>
	self
		given: 'A simple feature with two scenarios';
		when: 'we run the feature';
		then: 'we get results for all scenarios'
]

{ #category : #steps }
RunningFeatureFeature >> simpleFeatureWithTwoScenarios [
	<Given: 'A simple feature with two scenarios'>
	self pending
]
