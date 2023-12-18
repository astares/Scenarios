Class {
	#name : #BDDTestCase,
	#superclass : #TestCase,
	#instVars : [
		'scenarioNode'
	],
	#category : #'Scenarios-DrTests-Base'
}

{ #category : #'instance creation' }
BDDTestCase class >> for: aClass [ 
	^self new scenarioNode: aClass
]

{ #category : #accessing }
BDDTestCase >> scenarioNode: aClass [

	scenarioNode := aClass
]

{ #category : #tests }
BDDTestCase >> testIt [

	| value |
	value := self evaluate.
	self assert: value isAssociation.
	self assert: value key equals: value value
]
