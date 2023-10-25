{{
            config(
                unique_key = 'lga_code'
            )
}}

select concat('LGA', lga_code) as lga_code, lga_name
from {{source('raw', 'lga_code')}}
