{% snapshot room_type_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'timestamp',
                    unique_key = 'room_type_id',
                    updated_at = 'room_type_name'
                )
}}

select distinct row_number() as room_type_id,  room_type from {{source('raw', 'listing')}}

{% endsnapshot %}