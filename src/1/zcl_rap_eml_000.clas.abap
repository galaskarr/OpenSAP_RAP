CLASS zcl_rap_eml_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_000 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    " Step 1 - Somente os campos chaves são apresentados devido a falta de especificação
*    " de quais campos devem ser lidos.
*    READ ENTITIES OF zi_rap_atrav_000
*    ENTITY travel
*    FROM VALUE #( ( TravelUUID = '73ED0E305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(travels).
*
*    out->write( travels ).

*    " Step 2 - Apresentando campos específicos. Id da agência e Id do consumidor.
*    READ ENTITIES OF zi_rap_atrav_000
*    ENTITY travel
*    FIELDS ( AgencyID CustomerID )
*    WITH VALUE #( ( TravelUUID = '73ED0E305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(travels).
*
*    out->write( travels ).

*    " Step 3 - Apresentando todos os campos.
*    READ ENTITIES OF zi_rap_atrav_000
*    ENTITY travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '73ED0E305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(travels).
*
*    out->write( travels ).

*    " Step 4 - Apresentando campos por associação.
*    READ ENTITIES OF zi_rap_atrav_000
*    ENTITY travel by \_Booking
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '73ED0E305CB6B44917000C0214639CF0' ) )
*    RESULT DATA(bookings).
*
*    out->write( bookings ).

*    " Step 5 - Manipulação de falha
*    READ ENTITIES OF zi_rap_atrav_000
*    ENTITY travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*    RESULT DATA(travels)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ). " complex structures not supported by the console output
*    out->write( reported ). " complex structures not supported by the console output

*    " Step 6 - Implementação de modificação
*    MODIFY ENTITIES OF zi_rap_atrav_000
*    ENTITY travel
*    UPDATE SET FIELDS WITH VALUE #( ( TravelUUID  = '73ED0E305CB6B44917000C0214639CF0'
*                  Description = 'I like RAP@openSAP' ) )
*
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( 'Update done!!!' ).
*
*    " Step 6b - Commit Entities
*    COMMIT ENTITIES
*    RESPONSE OF zi_rap_atrav_000
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).

*    " Step 7 - Criar nova entidade
*    MODIFY ENTITIES OF zi_rap_atrav_000
*    ENTITY travel
*    CREATE SET FIELDS WITH VALUE
*    #( ( %cid        = 'MyContentID_1'
*                AgencyID    = '70012'
*                CustomerID  = '14'
*                BeginDate   = cl_abap_context_info=>get_system_date( )
*                EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                Description = 'I like RAP@openSAP' ) )
*    MAPPED DATA(mapped)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*    RESPONSE OF zi_rap_atrav_000
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).
*
*    out->write( 'Create done' ).

    " Step 8 - Excluir entidade
    MODIFY ENTITIES OF zi_rap_atrav_000
    ENTITY travel
    DELETE FROM VALUE
    #( ( TravelUUID  = '12F8688AE93B1EEB87AA28EAFA11A205' ) )
    FAILED DATA(failed)
    REPORTED DATA(reported).

    COMMIT ENTITIES
    RESPONSE OF zi_rap_atrav_000
    FAILED DATA(failed_commit)
    REPORTED DATA(reported_commit).

    out->write( 'Delete done!!!' ).


  ENDMETHOD.

ENDCLASS.
