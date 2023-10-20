
      
  
    

  create  table "postgres"."raw"."lga_snapshot"
  
  
    as
  
  (
    

    select *,
        md5(coalesce(cast(listing_neighbourhood as varchar ), '')
         || '|' || coalesce(cast(listing_neighbourhood as varchar ), '')
        ) as dbt_scd_id,
        listing_neighbourhood as dbt_updated_at,
        listing_neighbourhood as dbt_valid_from,
        nullif(listing_neighbourhood, listing_neighbourhood) as dbt_valid_to
    from (
        



select distinct listing_neighbourhood from "postgres"."raw"."listing"

    ) sbq



  );
  
  