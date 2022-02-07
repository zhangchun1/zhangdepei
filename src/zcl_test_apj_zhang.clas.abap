CLASS zcl_test_apj_zhang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_apj_dt_exec_object .
    INTERFACES if_apj_rt_exec_object .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_apj_zhang IMPLEMENTATION.


  METHOD if_apj_dt_exec_object~get_parameters.

   " Return the supported selection parameters here
    et_parameter_def = VALUE #(
      ( selname = 'S_ID'    kind = if_apj_dt_exec_object=>select_option datatype = 'C' length = 10 param_text = 'KEY ID'                                    changeable_ind = abap_true )
      ( selname = 'P_DESCR' kind = if_apj_dt_exec_object=>parameter     datatype = 'D' length = 80 param_text = 'CREATE DATE'   lowercase_ind = abap_true changeable_ind = abap_true )
 "     ( selname = 'P_COUNT' kind = if_apj_dt_exec_object=>parameter     datatype = 'I' length = 10 param_text = 'My Count'                                   changeable_ind = abap_true )
  "    ( selname = 'P_SIMUL' kind = if_apj_dt_exec_object=>parameter     datatype = 'C' length =  1 param_text = 'My Simulate Only' checkbox_ind = abap_true  changeable_ind = abap_true )
    ).

    " Return the default parameters values here
    et_parameter_val = VALUE #(
      ( selname = 'S_ID'    kind = if_apj_dt_exec_object=>select_option sign = 'I' option = 'EQ' low = '4711' )
      ( selname = 'P_DESCR' kind = if_apj_dt_exec_object=>parameter     sign = 'I' option = 'EQ' low = SY-DATUM )
   "   ( selname = 'P_COUNT' kind = if_apj_dt_exec_object=>parameter     sign = 'I' option = 'EQ' low = '200' )
   "   ( selname = 'P_SIMUL' kind = if_apj_dt_exec_object=>parameter     sign = 'I' option = 'EQ' low = abap_true )
    ).

  ENDMETHOD.


  METHOD if_apj_rt_exec_object~execute.

  TYPES ty_id TYPE c LENGTH 10.

    DATA s_id    TYPE RANGE OF ty_id.
    DATA p_descr TYPE c LENGTH 80.
    DATA p_count TYPE i.
    DATA p_simul TYPE abap_boolean.

    data lv_id(10) type n.

    " Getting the actual parameter values
    LOOP AT it_parameters INTO DATA(ls_parameter).
      CASE ls_parameter-selname.
        WHEN 'S_ID'.
          APPEND VALUE #( sign   = ls_parameter-sign
                          option = ls_parameter-option
                          low    = ls_parameter-low
                          high   = ls_parameter-high ) TO s_id.
          lv_id = ls_parameter-low.
        WHEN 'P_DESCR'. p_descr = ls_parameter-low.
   "     WHEN 'P_COUNT'. p_count = ls_parameter-low.
   "     WHEN 'P_SIMUL'. p_simul = ls_parameter-low.
      ENDCASE.
    ENDLOOP.

    " Implement the job execution
    data: lt_orders type table of zorders.
 "   delete from zorders.
    lt_orders = value #(
      ( id = lv_id creationdate = p_descr )
 "     ( id = '2' creationdate = '20210802'  )
 "      ( id = '3' creationdate = '20210803' )
    ).
    insert zorders from table @lt_orders.

  ENDMETHOD.
ENDCLASS.
