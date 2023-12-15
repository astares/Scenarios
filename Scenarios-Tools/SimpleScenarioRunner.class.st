Class {
	#name : #SimpleScenarioRunner,
	#superclass : #Object,
	#category : #'Scenarios-Tools'
}

{ #category : #running }
SimpleScenarioRunner >> runAll: aCollectionOfFeatureClasses [

	| result |
	result := FeatureResult new.
	aCollectionOfFeatureClasses do: [ :each | each new run: result ].
	^ result
]

{ #category : #running }
SimpleScenarioRunner >> runAllFeatures [

	^self runAll: Feature allSubclasses
]
