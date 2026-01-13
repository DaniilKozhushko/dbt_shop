{{
  config(
    materialized = 'table'
    )
}}

select
    product_id,
    "name",
    category_id,
    price,
    updated_at
from
    {{ source('raw', 'products') }}