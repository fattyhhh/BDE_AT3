{% snapshot lga_snapshot %}

{{
                config(
                    target_schema = 'raw',
                    strategy = 'check',
                    unique_key = 'lga_code'
                    check_cols = ['lga_code', 'lga_name']
                )
}}

select * from {{source('raw', 'lga_code')}}

{% endsnapshot %}