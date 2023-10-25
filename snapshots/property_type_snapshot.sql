{% snapshot property_type_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'property_type',
                    updated_at = 'scraped_date'
                )
}}

select property_type, min(scraped_date) as scraped_date from {{source('raw', 'listing')}} group by property_type

{% endsnapshot %}
