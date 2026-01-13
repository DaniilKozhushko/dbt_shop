select
    product_id,
    "name",
    category_id,
    price,
    updated_at,
    uom_id,
    is_active
from
    {{ source('raw', 'products') }}