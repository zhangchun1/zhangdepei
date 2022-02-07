@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ORDER ITEMS'
define view entity ZORDERITEMSVIEW as select from zorderitems {
  key orderid as OrderId,
  key pos as Pos,
  item as Item,
  amount as Amount
}
