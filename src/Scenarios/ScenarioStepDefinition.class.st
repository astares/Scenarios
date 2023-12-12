Class {
	#name : #ScenarioStepDefinition,
	#superclass : #TestAsserter,
	#instVars : [
		'definition',
		'selector'
	],
	#category : #'Scenarios-Base'
}

{ #category : #running }
ScenarioStepDefinition class >> buildStepDefinitions [
	^(self methods select: [ :each | each hasPragma and: [ each pragmas anySatisfy: [:e | #(#Given: #When: #Then:) includes: e selector] ] ])
		collect: [ :each | self define: each pragmas first arguments first perfoming: each selector ]
]

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

{ #category : #evaluating }
ScenarioStepDefinition >> valueWith: aString [ 
	self perform: selector
]
