
      
  
    

  create  table "postgres"."raw"."property_type_snapshot"
  
  
    as
  
  (
    

    select *,
        md5(coalesce(cast(property_type as varchar ), '')
         || '|' || coalesce(cast(scraped_date as varchar ), '')
        ) as dbt_scd_id,
        scraped_date as dbt_updated_at,
        scraped_date as dbt_valid_from,
        nullif(scraped_date, scraped_date) as dbt_valid_to
    from (
        



select property_type, min(scraped_date) as scraped_date from "postgres"."raw"."listing" group by property_type

    ) sbq



  );
  
  