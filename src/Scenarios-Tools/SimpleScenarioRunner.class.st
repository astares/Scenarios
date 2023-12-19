"
A simple runner for scenarios
"
Class {
	#name : #SimpleScenarioRunner,
	#superclass : #Object,
	#category : #'Scenarios-Tools-Base'
}

{ #category : #runnning }
SimpleScenarioRunner >> runAll: aCollectionOfFeatureClasses [

	| result |
	result := FeatureResult new.
	aCollectionOfFeatureClasses do: [ :each | each new run: result ].
	^ result
]

{ #category : #runnning }
SimpleScenarioRunner >> runAllFeatures [

	^ self runAll: Feature allSubclasses
]
