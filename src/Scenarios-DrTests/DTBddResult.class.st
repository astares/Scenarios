Class {
	#name : #DTBddResult,
	#superclass : #DTPluginResult,
	#category : #'Scenarios-DrTests'
}

{ #category : #accessing }
DTBddResult >> buildTreeForUI [
	<dtBehaviorDrivenDevelopmentResultTreeNamed: 'Grouped by type of result' order: 1>
	
	^ DTTreeNode new
		subResults: {
			DTTreeNode new
				name: DTTestResultType error pluralName;
				subResults: (self buildLeavesFrom: self passed type: DTTestResultType error);
				startExpanded;
				displayColorIfNotEmpty: TestResult defaultColorBackGroundForErrorTest;
				yourself.
			DTTreeNode new
				name: DTTestResultType fail pluralName;
				subResults: (self buildLeavesFrom: self failed type: DTTestResultType fail);
				startExpanded;
				displayColorIfNotEmpty: TestResult defaultColorBackGroundForFailureTest.
			DTTreeNode new
				name: DTTestResultType skipped pluralName;
				subResults: (self buildLeavesFrom: self undefined type: DTTestResultType skipped).
		};
		yourself
]
