namespace db.risks;

using {sap.common.CodeList} from '@sap/cds/common';

entity Risks {
  key ID                      : UUID;
      title                   : String(100);
      owner                   : String;
      description             : String;
      impact                  : Integer;
      priority                : Association to Priority;
      mitigation              : Association to Mitigation;
      // bp : Association to BusinessPartners;
      virtual criticality     : Integer;
      virtual PrioCriticality : Integer;
}

entity Mitigation {
  key ID          : UUID;
      owner       : String;
      timeline    : String;
      description : String;
      risks       : Association to many Risks
                      on risks.mitigation = $self;

}

entity Priority : CodeList {
  key code : String enum {
        H = 'High';
        M = 'Medium';
        L = 'Low';
      };
}
