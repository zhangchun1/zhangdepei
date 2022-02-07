@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ORDERS'
define view entity ZORDERSVIEW as select from zorders {
  key id as Id,
  creationdate as CreationDate
}
