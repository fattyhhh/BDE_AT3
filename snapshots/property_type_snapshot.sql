{% snapshot property_type_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'property_type_id',
                    updated_at = 'property_type_name'
                )
}}

select distinct row_number() as property_type_id, property_type from {{source('raw', 'listing')}}

{% endsnapshot %}
