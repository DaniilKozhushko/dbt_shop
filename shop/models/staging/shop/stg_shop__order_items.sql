{{
  config(
    materialized = 'table'
    )
}}

select
    order_item_id,
    order_id,
    product_id,
    quantity,
    price_at_purchase
from
    {{ source('raw', 'order_items') }}