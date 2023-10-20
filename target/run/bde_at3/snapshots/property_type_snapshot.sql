
      
  
    

  create  table "postgres"."raw"."property_type_snapshot"
  
  
    as
  
  (
    

    select *,
        md5(coalesce(cast(property_type_id as varchar ), '')
         || '|' || coalesce(cast(property_type_name as varchar ), '')
        ) as dbt_scd_id,
        property_type_name as dbt_updated_at,
        property_type_name as dbt_valid_from,
        nullif(property_type_name, property_type_name) as dbt_valid_to
    from (
        



select distinct row_number() as property_type_id, property_type from "postgres"."raw"."listing"

    ) sbq



  );
  
  