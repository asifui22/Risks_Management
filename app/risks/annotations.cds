using srv.risks.RiskService as service from '../../srv/service';

annotate service.Risks with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: title
    },
    {
        $Type: 'UI.DataField',
        Value: owner
    },
    {
        $Type: 'UI.DataField',
        Value: description
    },
    {
        $Type: 'UI.DataField',
        Value: impact
    },
    {
        $Type: 'UI.DataField',
        Label: 'Priority',
        Value: priority_code
    },
    {
        $Type: 'UI.DataField',
        Label: 'Mitigation',
        Value: mitigation_ID
    }
];


annotate service.Risks with @UI.Facets: [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'Main',
    Label : 'General Information',
    Target: '@UI.FieldGroup#Main'
}];

annotate service.Risks with @UI.FieldGroup #Main: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: title
        },
        {
            $Type: 'UI.DataField',
            Value: owner
        },
        {
            $Type: 'UI.DataField',
            Value: description
        },
        {
            $Type: 'UI.DataField',
            Value: impact
        },
        {
            $Type: 'UI.DataField',
            Label: 'Priority',
            Value: priority_code
        },
        {
            $Type: 'UI.DataField',
            Label: 'Mitigation',
            Value: mitigation_ID
        }
    ]
};
