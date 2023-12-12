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

{ #category : #ignored }
ScenarioStepDefinition >> resources [
	"We do not make use of test resources - so we ignore the subclass responsibility to implement this method"
	
	^ self shouldNotImplement 
]

{ #category : #ignored }
ScenarioStepDefinition >> setUp [
	"We do not make use of #setUp / tearDown cycle - so we ignore the subclass responsibility to implement this method"
		
	^ self shouldNotImplement
]

{ #category : #ignored }
ScenarioStepDefinition >> tearDown [
	"We do not make use of #setUp / tearDown cycle - so we ignore the subclass responsibility to implement this method"

	^ self shouldNotImplement
]

{ #category : #evaluating }
ScenarioStepDefinition >> valueWith: aString [ 
	self perform: selector
]
