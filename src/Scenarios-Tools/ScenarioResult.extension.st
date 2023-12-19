Extension { #name : #ScenarioResult }

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionFailed: aBuilder [
	<inspectorPresentationOrder: 2 title: 'Failed'>

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
		items: self failed asOrderedCollection;
		yourself
]

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionPassed: aBuilder [
	<inspectorPresentationOrder: 1 title: 'Passed'>

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
		items: self passed asOrderedCollection;
		yourself
]

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionResults: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Results'>

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

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionSkipped: aBuilder [
	<inspectorPresentationOrder: 4 title: 'Skipped'>

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
		items: self skipped asOrderedCollection;
		yourself
]

{ #category : #'*Scenarios-Tools' }
ScenarioResult >> inspectionUndefined: aBuilder [
	<inspectorPresentationOrder: 3 title: 'Undefined'>

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
		items: self undefined asOrderedCollection;
		yourself
]
