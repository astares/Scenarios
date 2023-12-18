Extension { #name : #ScenarioResult }

{ #category : #'*Scenarios-UI' }
ScenarioResult >> icon [
	results ifNil: [ ^ self class systemIcon ].
	self isPassed ifTrue: [ ^self iconNamed: #testGreen ].
	self hasFailed ifTrue: [ ^self iconNamed: #testRed ].
	^ self iconNamed: #testYellow
]

{ #category : #'*Scenarios-UI' }
ScenarioResult class >> systemIconName [

	^ #scenarioResult
]
