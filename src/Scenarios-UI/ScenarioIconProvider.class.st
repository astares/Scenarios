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

{ #category : #icons }
ScenarioIconProvider class >> featureResultIcon [
	<script: 'self featureResultIcon inspect'>

	^ self icons
			at: #'featureResultIcon'
			ifAbsentPut: [ self formFromEncodedString: self featureResultIconContents ]
]

{ #category : #'private - icons' }
ScenarioIconProvider class >> featureResultIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAF7SURBVDhPjZPPSgJRFMa/mXR0Bmz8
M4ILCUNwY5EOFhFCtg3a9gatWoYP0KZlPUTbkCAKqQhaRYkGtWwpiCaaJKYj5enqDJTjXcxv
+JjDveeee+53ZwRwWNJ1Wqw3sPnRxohl3IU01CIRvJRK3PwZdjWNegCRpSbTVjjMQoeculzm
YuFPR6LILSBa7ykqsmwG4yVMXaZHRTHHbHAL3MRiOFD9KMKNguDGfiCIt3jcmp2Ga0paX6OO
0Uc41AIxF1ttDQHZg3L5yZmJmUycikUXGQaoPwAVziRaTia4HnA5PvESc3FKh3nFuYkeyZ4r
QJas0AnZbIxKD3Pm7gOR7s8V0lfi3A64pqRSq4TeFxYiHYx+BFSbAYg+L54rs18i9wg0HKKa
e8dFvoUrptp6AzC+rVkHqHsqa/7fw27Dv+N3bmIvx/6ECeOOmSQB3Y1Pc8gGt4Dv2gdMOrY2
rRHmb1UztsE1MZ1MUzVRRWe7w9oBgpdBROtRVF4rtnzgF3ECnErxbDwrAAAAAElFTkSuQmCC'
]

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
		at: #scenarioResult put: self scenarioResultIcon;
		at: #scenarioStepDefinition put: self scenarioStepDefinitionIcon;
		at: #featureResult put: self featureResultIcon
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
ScenarioIconProvider class >> scenarioResultIcon [
	<script: 'self scenarioResultIcon inspect'>

	^ self icons
			at: #'scenarioResultIcon'
			ifAbsentPut: [ self formFromEncodedString: self scenarioResultIconContents ]
]

{ #category : #'private - icons' }
ScenarioIconProvider class >> scenarioResultIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAHTSURBVDhPlZFPSBRxFMc/v3HXjN2V
dlfIZEOLIkI0iiIiFMKDXaJDEATZrQ4hVmCnUAfvUYeICDxFdPDYn4OQKEUUQR3qUpgtOwu7
MTvsjprLuq7Tm91ZLI0av8OD9/2+37zf9/eeOnrkQGlvextKKYKNQcorZRzHYQOcnGUbHz/N
jeTzC5PCKzUZ1K3BM86Yfg1NU0I1HPnkfLX4Ow73DXMwm6W3UGBN+HQ8zvfWVvnDJ44lkzzO
ZBgsFhmSeJROk5ifJ+DVGRu962V/Qh+/ji61U4uLBF3BNSqISJwUN76fcGn/eR5aFmGPf5W4
3NKy2YE+fqN6Yx11B587OjjbGOaQWaAkNj7sjLK8K7aFIfbepK3d4niPzVpF8WZmB7ls7G8O
ajduzDs7U0xM5AiFqpT8lTwXLyz7d/Dk2WkGBsoeq+HB7ab1NboOHNmwPnrHU8SBaPWYnY2w
uuoVBEUzwMvpyFZmMEzXPpO+E0tUShpTr5v5komtO/gfmlQDr35s42qqgaGM4r0dYLum+W9g
7DFIP/3Gyj2L0n2L1OQcRnPafwPrnAVxN3OfKrEbzH7Tf4PQO29/dUi/8NtwbYie9E88nzEw
ug3sfht+QvRFlEQywS8KPcLXk6UXTQAAAABJRU5ErkJggg=='
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
