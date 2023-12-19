Class {
	#name : #Feature,
	#superclass : #Object,
	#instVars : [
		'scenarios',
		'scenario',
		'stepDefinitions'
	],
	#category : #Scenarios
}

{ #category : #running }
Feature >> run [

	| result |
	result := FeatureResult new.
	self run: result.
	^ result
]

{ #category : #running }
Feature >> run: aFeatureResult [

	self scenarios do: [ :each |
		| result |
		result := ScenarioResult scenario: each.
		aFeatureResult addResult: result.
		each run: result with: self stepDefinitions ]
]
