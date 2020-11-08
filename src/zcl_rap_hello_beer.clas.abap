CLASS zcl_rap_hello_beer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_hello_beer IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Cheers!!! ({ cl_abap_context_info=>get_user_alias(  ) })| ).
  ENDMETHOD.

ENDCLASS.
