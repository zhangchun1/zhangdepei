class zcl_fill_orders definition

  public
  final
  create public.

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.

ENDCLASS.



CLASS ZCL_FILL_ORDERS IMPLEMENTATION.


  method if_oo_adt_classrun~main.

    data: lt_orders type table of zorders.
    delete from zorders.
    lt_orders = value #(
      ( id = '1' creationdate = '20210801' )
      ( id = '2' creationdate = '20210802'  )
      ( id = '3' creationdate = '20210803' )
    ).
    insert zorders from table @lt_orders.
    out->write( sy-dbcnt ).

    data: lt_orderitems type table of zorderitems.
    delete from zorderitems.
    lt_orderitems = value #(
      ( orderid = '1' pos = '1' item = 'Apple' amount = '5' )
      ( orderid = '1' pos = '2' item = 'Banana' amount = '5' )
      ( orderid = '1' pos = '3' item = 'Orange Juice' amount = '2' )

      ( orderid = '2' pos = '1' item = 'Orange' amount = '10' )
      ( orderid = '2' pos = '2' item = 'Apple' amount = '5' )

      ( orderid = '3' pos = '1' item = 'Bottle Water' amount = '5' )
    ).
    insert zorderitems from table @lt_orderitems.
    out->write( sy-dbcnt ).

  endmethod.
ENDCLASS.
