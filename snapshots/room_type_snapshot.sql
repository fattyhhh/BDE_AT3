{% snapshot room_type_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'room_type',
                    updated_at = 'scraped_date'
                )
}}

select room_type, min(scraped_date) as scraped_date from {{source('raw', 'listing')}} group by room_type

{% endsnapshot %}