namespace srv.risks;


using {db.risks as db} from '../db/schema.cds';

@path    : '/RiskService'
@requires: 'authenticated-user'
service RiskService {
  @odata.draft.enabled
  entity Risks      as projection on db.Risks;

  @odata.draft.enabled
  entity Mitigation as projection on db.Mitigation;

}
