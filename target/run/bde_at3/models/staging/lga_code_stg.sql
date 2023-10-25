
  create view "postgres"."public_staging"."lga_code_stg__dbt_tmp"
    
    
  as (
    

select concat('LGA', lga_code) as lga_code, lga_name
from "postgres"."raw"."lga_code"
  );