{% snapshot lga_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'listing_neighbourhood',
                    updated_at = 'listing_neighbourhood'
                )
}}

select distinct listing_neighbourhood from {{source('raw', 'listing')}}

{% endsnapshot %}