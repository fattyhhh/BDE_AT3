{{
        config(
            unique_key = 'lga_code_2016'
        )
}}

select * from {{source('raw', 'census_g02')}}

