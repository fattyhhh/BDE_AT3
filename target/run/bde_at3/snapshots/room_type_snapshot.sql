
      
  
    

  create  table "postgres"."raw"."room_type_snapshot"
  
  
    as
  
  (
    

    select *,
        md5(coalesce(cast(room_type_id as varchar ), '')
         || '|' || coalesce(cast(room_type_name as varchar ), '')
        ) as dbt_scd_id,
        room_type_name as dbt_updated_at,
        room_type_name as dbt_valid_from,
        nullif(room_type_name, room_type_name) as dbt_valid_to
    from (
        



select distinct row_number() as room_type_id,  room_type from "postgres"."raw"."listing"

    ) sbq



  );
  
  