using { srv.risks.RiskService as service } from '../srv/service.cds';

annotate service.Risks with @UI.HeaderInfo: { TypeName: 'Risk', TypeNamePlural: 'Risks' };
annotate service.Risks with {
  priority @Common.ValueList: {
    CollectionPath: 'Priority',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: priority_code, 
        ValueListProperty: 'code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate service.Risks with {
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
annotate service.Risks with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate service.Risks with {
  title @title: 'Title';
  owner @title: 'Owner';
  description @title: 'Description';
  impact @title: 'Impact'
};

annotate service.Risks with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: owner },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: impact },
    { $Type: 'UI.DataField', Label: 'Priority', Value: priority_code },
    { $Type: 'UI.DataField', Label: 'Mitigation', Value: mitigation_ID }
];

annotate service.Risks with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: owner },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: impact },
    { $Type: 'UI.DataField', Label: 'Priority', Value: priority_code },
    { $Type: 'UI.DataField', Label: 'Mitigation', Value: mitigation_ID }
  ]
};

annotate service.Risks with {
  priority @Common.Label: 'Priority';
  mitigation @Common.Label: 'Mitigation'
};

annotate service.Risks with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' }
];

annotate service.Risks with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate service.Risks with @UI.SelectionFields: [
  priority_code,
  mitigation_ID
];

annotate service.Mitigation with @UI.HeaderInfo: { TypeName: 'Mitigation', TypeNamePlural: 'Mitigations' };
annotate service.Mitigation with {
  description @title: 'Description'
};

annotate service.Mitigation with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate service.Mitigation with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate service.Mitigation with {
  risks @Common.Label: 'Risks'
};

annotate service.Mitigation with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate service.Priority with @UI.HeaderInfo: { TypeName: 'Priority', TypeNamePlural: 'Priorities' };
annotate service.Priority with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate service.Priority with {
  name @title: 'Name'
};

annotate service.Priority with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name }
];

annotate service.Priority with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name }
  ]
};

// annotate service.Priority with {
//   risks @Common.Label: 'Risks'
// };

annotate service.Priority with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate service.Priority with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

