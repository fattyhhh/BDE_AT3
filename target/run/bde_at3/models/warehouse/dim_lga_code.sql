
  
    

  create  table "postgres"."public_warehouse"."dim_lga_code__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."lga_code_stg"
  );
  