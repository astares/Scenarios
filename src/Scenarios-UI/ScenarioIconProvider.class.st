"
Icon provider utility
"
Class {
	#name : #ScenarioIconProvider,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Scenarios-UI-Utilities'
}

{ #category : #'private - accessing' }
ScenarioIconProvider class >> formFromEncodedString: base64String [

	^ Form fromBinaryStream: (base64String base64Decoded asByteArray readStream)
]

{ #category : #'private - utilities' }
ScenarioIconProvider class >> generateIcon [
	<script>

	| base64Contents contentsMethod iconName fileRef |
	fileRef := UIManager default chooseExistingFileReference: 'Select the PNG file'
							extensions: #('png')
							path: ''.
	fileRef ifNil: [ ^ self ].
	iconName := UIManager default request: 'Class name for Icon' initialAnswer: 'blank'.
	iconName ifNil: [ ^ self ].
	base64Contents := (Base64MimeConverter mimeEncode: fileRef binaryReadStream) contents.

	contentsMethod := String
		streamContents: [ :s |
			s
				nextPutAll: iconName;
				nextPutAll: 'IconContents';
				cr;
				cr;
				tab;
				nextPut: $^;
				nextPut: $';
				nextPutAll: base64Contents;
				nextPut: $' ].
	self class compile: contentsMethod classified: #'private - icons'
]

{ #category : #accessing }
ScenarioIconProvider class >> icons [

	IconCache ifNil: [ IconCache := Dictionary new ].
	^ IconCache
]

{ #category : #'class initialization' }
ScenarioIconProvider class >> initialize [

	Smalltalk ui icons icons 
		at: #scenario put: self scenarioIcon;
		at: #scenarioStep put: self scenarioStepIcon;
		at: #scenarioStepDefinition put: self scenarioStepDefinitionIcon
	
]

{ #category : #icons }
ScenarioIconProvider class >> scenarioIcon [
	<script: 'self scenarioIcon inspect'>
		
	^ self icons
			at: #'scenarioIcon'
			ifAbsentPut: [ self formFromEncodedString: self scenarioIconContents ]
]

{ #category : #'private - icons' }
ScenarioIconProvider class >> scenarioIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFsSURBVDhPlZPNSsNAEMd3k2ygQQs2
KFLUoiB6Lt69ehEKvoYHPYtt7AOoF0/iEwg+Qasnzx7Em+DBmzSt1g9o87HObHbTfIikP5jM
zCY782c2S+2ywdyhP79V33hZq1UJpZQwkxFv7BHOOcnAe+7H68Pj8/FgMLyGPCA79TKFYOlo
f5ePex3u97tgd9zr34J1/7S9xvYT7FnGilplRkc/FZvrKwuMMRtjQ6yANOlJq3kuozRO+4A4
8A69RjVUjUaMkqkJjw/kBD4AYVARa6ZngJsRXPU8T8TaVcfFXFRBUEGreSpi0VGayhEeBsIj
cWdFUoHqqFA5pXG/uHOkB5gogAKZ7ipOUlhBVo1CKUidAichdDuTK/lZABXpYwW5U3Dah+Cj
utnuybNRCiZTKUDg+zIiiXFOgVVi4ieqLs7lZ1AEXde+LMuiqzU7LvAufVF+wPib+wl3N4LC
bQxl/C+hOYtyvy8ubxqjUXj/C2WCoT/zf5ygAAAAAElFTkSuQmCC'
]

{ #category : #icons }
ScenarioIconProvider class >> scenarioStepDefinitionIcon [
	<script: 'self scenarioStepDefinitionIcon inspect'>
		
	^ self icons
			at: #'scenarioStepDefinitionIcon'
			ifAbsentPut: [ self formFromEncodedString: self scenarioStepDefinitionIconContents ]
]

{ #category : #'private - icons' }
ScenarioIconProvider class >> scenarioStepDefinitionIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAIHSURBVDhPY8AGHB2d1svJyu+HcvEC
JiiNAv79/avw7/8/ASgXL2CE0iigra3d4fq1aw4cnJz8f/78ZggLC1vo6el5ASqNArC6gBFo
7H8gfePGdYP58+cXADWfl5WRu5+QkNi/fv16A4gqCMBqAFg3EDDCHcjI8PjJI4UFC+YXBAUF
nQ8MDJwPlcBhABT8h5kEpMVExT8kJ6csOHDggCHQFYlQCfwGcHJwMZiZmR+YNWt24uUrlxTn
zp2TaG9vjzUsUEBba5tDbGxcA5SLF2B3AdDrTKCQJAIwVuf48gNpkGf/gAQc/TJsu7p7458/
ey6XEBe5j5/j57r7ty99AkoJAfFXqLrPQPwFiP+DDPABMvRBElx8Yppbdx6K//nzNzgAf/76
w6Cpof5QXY67EijPDcQgZ/EAMSsQswPxb5ABnEAGyCv/Nx24vfvevftWjEDu////GX7//gs0
5h/D9CmTPO9f2XEEqAYEQK79DsQgfQwsQBwNxOJA/EtckFWTW10G6H8mhn///jGwsYGk/zM8
uXsyA8iwBeKfYAFE2P0BuUAWyPgFwi++CpcsXLy4CiTD+J8RbDsXN8+Hw4ePKK6aXf0RKMwF
kgLJQwE4DLKgHJC/uL794fA+deayxtdv34Xl5aRvmhtprPn66fUroBwoANHBVaxxBTQU5HY2
CA8MQIaDxNAAw3cAuvSxshzELGYAAAAASUVORK5CYII='
]

{ #category : #icons }
ScenarioIconProvider class >> scenarioStepIcon [
	<script: 'self scenarioStepIcon inspect'>
		
	^ self icons
			at: #'scenarioStepIcon'
			ifAbsentPut: [ self formFromEncodedString: self scenarioStepIconContents ]
]

{ #category : #'private - icons' }
ScenarioIconProvider class >> scenarioStepIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFZSURBVDhPY8AGHB2d1svJyu+HcvEC
JiiNAv79/avw7/8/ASgXL2CE0iigra3d4fq1aw4cnJz8f/78ZggLC1vo6el5ASqNArC6gBFo
7H8gfePGdYP58+cXADWfl5WRu5+QkNi/fv16A4gqCMBqAFg3EDDCHcjI8PjJI4UFC+YXBAUF
nQ8MDJwPlcBhABT8h5kEpMVExT8kJ6csOHDggCHQFYlQCfwGcHJwMZiZmR+YNWt24uUrlxTn
zp2TaG9vjzUsUEBba5tDbGxcA5SLF2B3AdDrTKCQJAccP37cwcHBcb6Kiur+KZOnFLx9+5ao
9AAGixYuCmBhZgGFHBAzgmlra5vzYEligIqKCij5/mdkYIJjEB9osANYARaAEgavXr1SgDJR
wJu3b7CKY4CkxCRQyIOdD7Odh4f3/cWLl4gPh+Tk5H4uTu77IEO0NLX2b9y4ESXpUhkwMAAA
3z1yvfN4SJMAAAAASUVORK5CYII='
]
