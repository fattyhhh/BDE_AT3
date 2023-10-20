{% snapshot host_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'host_id',
                    updated_at =  'host_name'
                )
}}

select distinct host_id, host_name from {{ source('raw', 'listing')}}

{% endsnapshot %}
