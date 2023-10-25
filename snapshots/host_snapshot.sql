{% snapshot host_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'host_id',
                    updated_at = 'scraped_date'
                )
}}

select host_id, host_name, host_since, host_is_superhost, min(scraped_date) as scraped_date from {{ source('raw', 'listing')}} group by host_id, host_name, host_since, host_is_superhost
 
{% endsnapshot %}
