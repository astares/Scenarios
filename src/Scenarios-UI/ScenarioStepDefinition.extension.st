Extension { #name : #ScenarioStepDefinition }

{ #category : #'*Scenarios-UI' }
ScenarioStepDefinition >> icon [

	^ self iconNamed: self class systemIconName
]

{ #category : #'*Scenarios-UI' }
ScenarioStepDefinition class >> systemIconName [

	^#scenarioStepDefinition
]
