
  
    

  create  table "postgres"."public_warehouse"."dim_g01__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."g01_stg"
  );
  