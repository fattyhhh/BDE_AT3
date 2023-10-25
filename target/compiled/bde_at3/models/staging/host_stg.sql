

with 

source as (

    select * from "postgres"."raw"."host_snapshot" 

),

transform as (
    select 
        host_id,
        host_name,
        case when host_since <> 'NaN' then to_timestamp(host_since, 'DD/MM/YYYY') else '1900-01-01'::timestamp end as host_since,
        case when host_is_superhost = 't' then true else false end as host_is_superhost,
        dbt_valid_from,
        dbt_valid_to
    from source
),

unknown as (
    select 
        0 as host_id,
        'Unknown' as host_name,
        '1900-01-01'::timestamp as host_since,
        false as host_is_superhost,
        '1900-01-01'::timestamp as dbt_valid_from,
        null::timestamp as dbt_valid_to
)

select * from transform
union all
select * from unknown