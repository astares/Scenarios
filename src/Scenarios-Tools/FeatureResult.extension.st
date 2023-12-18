Extension { #name : #FeatureResult }

{ #category : #'*Scenarios-Tools' }
FeatureResult >> inspectionScenarioResults: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Scenario Results'>

	^ aBuilder newTable
		addColumn: (SpIndexTableColumn new
			title: 'Index';
			sortFunction: #yourself ascending;
			beNotExpandable;
			yourself);
		addColumn: (SpImageTableColumn new
				evaluated: #icon;
				beNotExpandable;
				yourself);
		addColumn: (SpStringTableColumn new
			title: 'Value';
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			sortFunction: #printString ascending;
			yourself);
		items: results asOrderedCollection;
		yourself
]
