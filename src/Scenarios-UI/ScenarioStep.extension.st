Extension { #name : #ScenarioStep }

{ #category : #'*Scenarios-UI' }
ScenarioStep >> icon [
	result ifNil: [ ^ self iconNamed: self class systemIconName ].
	self wasNotRun ifTrue: [ self iconNamed: #testNotRun ].
	self isPassed ifTrue: [ ^self iconNamed: #testGreen ].
	self isFailed ifTrue: [ ^self iconNamed: #testRed ].
	self isSkipped ifTrue: [ ^self iconNamed: #testNotRun ].
	^ self iconNamed: #testYellow
]

{ #category : #'*Scenarios-UI' }
ScenarioStep class >> systemIconName [

	^#scenarioStep
]
