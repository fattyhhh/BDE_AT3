{{
            config(
                unique_key = 'room_type'
            )
}}

with source as (
    select * from {{ref('room_type_snapshot')}}
),

transform as (
    select
        room_type,
        dbt_valid_from,
        dbt_valid_to
    from source
),

unknown as (
    select 
    'unknown' as room_type,
    '1900-01-01'::timestamp as dbt_valid_from,
    null::timestamp as dbt_valid_to
)

select * from transform
union all
select * from unknown