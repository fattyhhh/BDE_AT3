

with suburb_capital as (
    select initcap(lga_name) as lga_name, initcap(suburb_name) as suburb_name
    from "postgres"."raw"."lga_suburb"
)

select cod.lga_code, cap.suburb_name 
from "postgres"."public_staging"."lga_code_stg" cod
right join suburb_capital cap
on cod.lga_name = cap.lga_name