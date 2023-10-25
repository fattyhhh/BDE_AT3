{{

            config (
                unique_key = 'property_type'
            )
}}

with source as (

    select * from {{ref('property_type_snapshot')}}
),

transform as (
    select 
        property_type,
        dbt_valid_from,
        dbt_valid_to
    from source
),

unknown as (
    select 
    'unknown' as property_type,
    '1900-01-01'::timestamp as dbt_valid_from,
    null::timestamp as dbt_valid_to
)
select * from transform
union all
select * from unknown