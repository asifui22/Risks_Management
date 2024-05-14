using { myNamespace } from '../db/schema.cds';

@path: '/service/myNamespace'
@requires: 'authenticated-user'
service myNamespaceSrv {
  @odata.draft.enabled
  entity Risks as projection on myNamespace.Risks;
  @odata.draft.enabled
  entity Mitigation as projection on myNamespace.Mitigation;
  @odata.draft.enabled
  entity Priority as projection on myNamespace.Priority;
}