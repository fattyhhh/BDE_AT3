
  
    

  create  table "postgres"."public_warehouse"."dim_lga_suburb__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."lga_suburb_stg"
  );
  