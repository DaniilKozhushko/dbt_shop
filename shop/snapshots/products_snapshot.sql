{% snapshot products_snapshot %}

{{
    config(
      target_database='shop_db',
      target_schema='snapshots',
      unique_key='product_id',

      strategy='check',
      check_cols=['price', 'is_active', 'name'],
    )
}}

select * from {{ source('raw', 'products') }}

{% endsnapshot %}