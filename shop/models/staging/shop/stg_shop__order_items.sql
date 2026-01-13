{{
  config(
    materialized = 'table'
    )
}}

select
    order_id,
    product_id,
    quantity,
    price_at_purchase
from
    {{ source('raw', 'order_items') }}