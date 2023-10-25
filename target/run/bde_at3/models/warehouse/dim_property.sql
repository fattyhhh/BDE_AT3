
  
    

  create  table "postgres"."public_warehouse"."dim_property__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."property_stg"
  );
  