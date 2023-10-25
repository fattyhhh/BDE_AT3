
  create view "postgres"."public_staging"."g02_stg__dbt_tmp"
    
    
  as (
    

select * from "postgres"."raw"."census_g02"
  );