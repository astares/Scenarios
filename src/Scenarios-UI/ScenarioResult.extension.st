Extension { #name : #ScenarioResult }

{ #category : #'*Scenarios-UI' }
ScenarioResult >> icon [

	self isPassed ifTrue: [ ^self iconNamed: #testGreen ].
	self hasFailed ifTrue: [ ^self iconNamed: #testRed ].
	^ self iconNamed: #testYellow
]
