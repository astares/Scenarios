Class {
	#name : #DTBddPlugin,
	#superclass : #DrTestsPlugin,
	#category : #'Scenarios-DrTests-Plugin'
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

{ #category : #'configuration building' }
DTBddPlugin >> buildConfigurationFrom: aDrTests [

	^ DTBddConfiguration items: aDrTests selectedItems packages: aDrTests packagesSelected
]

{ #category : #accessing }
DTBddPlugin >> itemsToBeAnalysedFor: packagesSelected [
	"This method returns the items to be analysed by the plugin.
	For most plugins it will be TestCases but some plugins will return other objects like comments."

	^ packagesSelected
		flatCollect:
			[ :p | p definedClasses select: [ :c | c isFeature and: [ c isAbstract not ] ] ]
]

{ #category : #api }
DTBddPlugin >> packagesAvailableForAnalysis [
	^ RPackage organizer packages
		select: [ :p | p definedClasses anySatisfy: [ :c | c isFeature and: [ c isAbstract not ]] ]
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
DTBddPlugin >> runSuite: aTestSuite withResult: aResult [
	aTestSuite
		when: TestAnnouncement
		do: [ :testAnnouncement |
			self announceStatusChanged: ('Running test {1}.' format: {testAnnouncement test asString}) ].
	[ aTestSuite run: aResult ]
		ensure: [ aTestSuite unsubscribe: TestAnnouncement ]
]

{ #category : #api }
DTBddPlugin >> runTestSuites: testSuites [
	| result |
	result := TestAsserter classForTestResult new.
	CurrentExecutionEnvironment
		runTestsBy: [ testSuites
				do: [ :testSuite | self runSuite: testSuite withResult: result ]
				displayingProgress: 'Running Tests' ].
	^ result
]

{ #category : #api }
DTBddPlugin >> startButtonHelp [

	^ 'Run BDD scenarios in selected packages' translated
]

{ #category : #api }
DTBddPlugin >> startButtonLabel [

	^ 'Run Scenarios' translated
]
