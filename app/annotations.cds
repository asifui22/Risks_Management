using { myNamespaceSrv } from '../srv/service.cds';

annotate myNamespaceSrv.Risks with @UI.HeaderInfo: { TypeName: 'Risk', TypeNamePlural: 'Risks' };
annotate myNamespaceSrv.Risks with {
  priority @Common.ValueList: {
    CollectionPath: 'Priority',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: priority_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate myNamespaceSrv.Risks with {
  mitigation @Common.ValueList: {
    CollectionPath: 'Mitigation',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: mitigation_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate myNamespaceSrv.Risks with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate myNamespaceSrv.Risks with {
  title @title: 'Title';
  owner @title: 'Owner';
  description @title: 'Description';
  impact @title: 'Impact'
};

annotate myNamespaceSrv.Risks with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: owner },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: impact },
    { $Type: 'UI.DataField', Label: 'Priority', Value: priority_ID },
    { $Type: 'UI.DataField', Label: 'Mitigation', Value: mitigation_ID }
];

annotate myNamespaceSrv.Risks with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: owner },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: impact },
    { $Type: 'UI.DataField', Label: 'Priority', Value: priority_ID },
    { $Type: 'UI.DataField', Label: 'Mitigation', Value: mitigation_ID }
  ]
};

annotate myNamespaceSrv.Risks with {
  priority @Common.Label: 'Priority';
  mitigation @Common.Label: 'Mitigation'
};

annotate myNamespaceSrv.Risks with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' }
];

annotate myNamespaceSrv.Risks with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate myNamespaceSrv.Risks with @UI.SelectionFields: [
  priority_ID,
  mitigation_ID
];

annotate myNamespaceSrv.Mitigation with @UI.HeaderInfo: { TypeName: 'Mitigation', TypeNamePlural: 'Mitigations' };
annotate myNamespaceSrv.Mitigation with {
  description @title: 'Description'
};

annotate myNamespaceSrv.Mitigation with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate myNamespaceSrv.Mitigation with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate myNamespaceSrv.Mitigation with {
  risks @Common.Label: 'Risks'
};

annotate myNamespaceSrv.Mitigation with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate myNamespaceSrv.Priority with @UI.HeaderInfo: { TypeName: 'Priority', TypeNamePlural: 'Priorities' };
annotate myNamespaceSrv.Priority with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate myNamespaceSrv.Priority with {
  name @title: 'Name'
};

annotate myNamespaceSrv.Priority with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name }
];

annotate myNamespaceSrv.Priority with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name }
  ]
};

annotate myNamespaceSrv.Priority with {
  risks @Common.Label: 'Risks'
};

annotate myNamespaceSrv.Priority with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate myNamespaceSrv.Priority with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

