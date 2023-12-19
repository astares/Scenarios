"
A specific configuration for Dr. Test to support BDD
"
Class {
	#name : #DTBddConfiguration,
	#superclass : #DTPluginConfiguration,
	#category : #'Scenarios-DrTests-Plugin'
}

{ #category : #converting }
DTBddConfiguration >> asTestSuite [

	| suite classes |
	suite := TestSuite named: 'Scenarios Generated From Classes'.
	classes := self items addAll: (self items collect: [ :each | each class ]); yourself.
	classes do: [ :class |
			suite addTest: (BDDTestCase for: class)  ].
	^ suite
]
