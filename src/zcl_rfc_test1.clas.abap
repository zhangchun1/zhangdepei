CLASS zcl_rfc_test1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rfc_test1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TRY.

        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination(
          i_name = 'wangTest' ).
        DATA(lv_destination) = lo_destination->get_destination_name( ).
        DATA lv_result TYPE c LENGTH 200.

        CALL FUNCTION 'Z_TEST'
          DESTINATION lv_destination.
         " IMPORTING
           " rfcsi_export = lv_result.

        out->write( lv_destination && '|' && lv_result ).

      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
