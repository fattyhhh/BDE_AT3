
  
    

  create  table "postgres"."public_warehouse"."dim_host__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."host_stg"
  );
  