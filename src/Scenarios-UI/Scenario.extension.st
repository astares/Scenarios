Extension { #name : #Scenario }

{ #category : #'*Scenarios-UI' }
Scenario >> icon [

	^ self iconNamed: self class systemIconName
]

{ #category : #'*Scenarios-UI' }
Scenario class >> systemIconName [

	^#scenario
]
