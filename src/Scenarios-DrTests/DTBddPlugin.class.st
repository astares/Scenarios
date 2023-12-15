Class {
	#name : #DTBddPlugin,
	#superclass : #DrTestsPlugin,
	#category : #'Scenarios-DrTests'
}

{ #category : #'api - accessing' }
DTBddPlugin class >> pluginName [

	^ 'Behavior Driven Development (Scenarios)'
]

{ #category : #'api - accessing' }
DTBddPlugin class >> pluginResultClass [

	^ DTBddResult
]

{ #category : #'api - accessing' }
DTBddPlugin class >> weight [

	^ 8
]

{ #category : #api }
DTBddPlugin >> allowMiniDrTests [

	^ true
]

{ #category : #accessing }
DTBddPlugin >> itemsToBeAnalysedFor: packagesSelected [
	"This method returns the items to be analysed by the plugin.
	For most plugins it will be TestCases but some plugins will return other objects like comments."

	^ packagesSelected
		flatCollect:
			[ :p | p definedClasses select: [ :c | c isFeature ] ]
]

{ #category : #accessing }
DTBddPlugin >> pragmaForResultTrees [

	^ #'dtBehaviorDrivenDevelopmentResultTreeNamed:order:'
]

{ #category : #api }
DTBddPlugin >> resultButtonHelp [

	^ 'Browse the result selected in the results list.' translated
]

{ #category : #api }
DTBddPlugin >> runForConfiguration: aDTpluginConfiguration [
	^ self pluginResultClass new
			testResults: (self runTestSuites: {aDTpluginConfiguration asTestSuite});
			yourself
]

{ #category : #api }
DTBddPlugin >> startButtonHelp [

	^ 'Run BDD scenarios in selected packages' translated
]

{ #category : #api }
DTBddPlugin >> startButtonLabel [

	^ 'Run Scenarios' translated
]
