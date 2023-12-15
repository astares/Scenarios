Class {
	#name : #FeatureResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #Scenarios
}

{ #category : #adding }
FeatureResult >> addResult: aScenarioResult [

	^results add: aScenarioResult
]

{ #category : #accessing }
FeatureResult >> failedCount [

	^(results reject: [ :each | each isPassed ]) size
]

{ #category : #accessing }
FeatureResult >> failedStepCount [
	^results inject: 0 into: [ :sum :each | sum + each failedCount ]
]

{ #category : #initialization }
FeatureResult >> initialize [

	results := OrderedCollection new
]

{ #category : #accessing }
FeatureResult >> passedCount [

	^(results select: [ :each | each isPassed ]) size
]

{ #category : #accessing }
FeatureResult >> passedStepCount [
	^results inject: 0 into: [ :sum :each | sum + each passedCount ]
]

{ #category : #printing }
FeatureResult >> printOn: aStream [

	aStream
		nextPutAll: self resultCount asString;
		nextPutAll: ' scenarios (';
		nextPutAll: self passedCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedCount asString;
		nextPutAll: ' failed)';
		nextPutAll: String cr;
		nextPutAll: self stepCount asString;
		nextPutAll: ' steps (';
		nextPutAll: self passedStepCount asString;
		nextPutAll: ' passed, ';
		nextPutAll: self failedStepCount asString;
		nextPutAll: ' failed, ';
		nextPutAll: self undefinedStepCount asString;
		nextPutAll: ' undefined, ';
		nextPutAll: self skippedStepCount asString;
		nextPutAll: ' skipped)'
]

{ #category : #accessing }
FeatureResult >> resultCount [

	^results size
]

{ #category : #accessing }
FeatureResult >> skippedStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each skippedCount ]
]

{ #category : #accessing }
FeatureResult >> stepCount [
	
	^results inject: 0 into: [ :sum :each | sum + each resultCount ]
]

{ #category : #accessing }
FeatureResult >> undefinedStepCount [

	^ results inject: 0 into: [ :sum :each | sum + each undefinedCount ]
]
