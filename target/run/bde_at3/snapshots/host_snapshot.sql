
      
  
    

  create  table "postgres"."raw"."host_snapshot"
  
  
    as
  
  (
    

    select *,
        md5(coalesce(cast(host_id as varchar ), '')
         || '|' || coalesce(cast(scraped_date as varchar ), '')
        ) as dbt_scd_id,
        scraped_date as dbt_updated_at,
        scraped_date as dbt_valid_from,
        nullif(scraped_date, scraped_date) as dbt_valid_to
    from (
        



select host_id, host_name, host_since, host_is_superhost, min(scraped_date) as scraped_date from "postgres"."raw"."listing" group by host_id, host_name, host_since, host_is_superhost
 
    ) sbq



  );
  
  