Extension { #name : #Feature }

{ #category : #'*Scenarios-Tools' }
Feature >> inspectionScenarios: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Scenarios'>

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
		items: self scenarios asOrderedCollection;
		yourself
]

{ #category : #'*Scenarios-Tools' }
Feature >> inspectionStepDefinitions: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Step Definitions'>

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
			title: 'Definition';
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each definition ];
			sortFunction: #definition ascending;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Selector';
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each selector ];
			sortFunction: #selector ascending;
			yourself);
		items: self stepDefinitions asOrderedCollection;
		yourself
]
