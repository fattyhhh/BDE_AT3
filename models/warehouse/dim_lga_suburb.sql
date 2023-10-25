{{
            config(
                unique_key = 'lga_suburb'
            )
}}

select * from {{ref('lga_suburb_stg')}}