Extension { #name : #ScenarioStep }

{ #category : #'*Scenarios-UI' }
ScenarioStep >> icon [

	^ self iconNamed: self class systemIconName
]

{ #category : #'*Scenarios-UI' }
ScenarioStep class >> systemIconName [

	^#scenarioStep
]
