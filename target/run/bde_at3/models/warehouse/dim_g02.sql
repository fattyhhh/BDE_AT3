
  
    

  create  table "postgres"."public_warehouse"."dim_g02__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."g02_stg"
  );
  