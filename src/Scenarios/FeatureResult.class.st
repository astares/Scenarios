"
A feature result to capture results for a feature separately from those of a scenario
"
Class {
	#name : #FeatureResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #'Scenarios-Base'
}

{ #category : #accessing }
FeatureResult >> failedCount [

	^ (results reject: [ :each | each isPassed ]) size
]

{ #category : #initialization }
FeatureResult >> initialize [

	super initialize.
	results := OrderedCollection new
]

{ #category : #accessing }
FeatureResult >> passedCount [

	^ results inject: 0 into: [ :sum :each | sum + each passedCount ]
]

{ #category : #printing }
FeatureResult >> printOn: aStream [

	aStream
		nextPutAll: self passedCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedCount asString;
		nextPutAll: ' failed, ';
		nextPutAll: self undefinedCount asString;
		nextPutAll: ' undefined.'
]

{ #category : #accessing }
FeatureResult >> resultCount [

	^ results inject: 0 into: [ :sum :each | sum + each resultCount ]
]

{ #category : #accessing }
FeatureResult >> undefinedCount [

	^ results inject: 0 into: [ :sum :each | sum + each undefinedCount ]
]
