"
Definition of a ScenarioStep
"
Class {
	#name : #ScenarioStepDefinition,
	#superclass : #Object,
	#instVars : [
		'definition',
		'selector'
	],
	#category : #'Scenarios-Base'
}

{ #category : #'instance creation' }
ScenarioStepDefinition class >> define: aString perfoming: aSymbol [ 
	^self new
		definition: aString selector: aSymbol;
		yourself
]

{ #category : #accessing }
ScenarioStepDefinition >> definition [

	^ definition
]

{ #category : #initialization }
ScenarioStepDefinition >> definition: aString selector: aSymbol [

	definition := aString.
	selector := aSymbol
]

{ #category : #accessing }
ScenarioStepDefinition >> selector [

	^ selector
]

{ #category : #evaluating }
ScenarioStepDefinition >> value: aFeature with: aString [

	aFeature perform: selector
]
