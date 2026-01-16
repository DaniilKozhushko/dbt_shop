{{
    config(
        materialized='incremental',
        unique_key='order_item_sk',
        on_schema_change='fail' 
    )
}}

with source_data as (
    select * from {{ ref('int_sales_enriched') }}
)

select * from source_data

{% if is_incremental() %}
    where order_updated_at > (select max(order_updated_at) from {{ this }})
{% endif %}