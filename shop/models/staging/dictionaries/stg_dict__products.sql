SELECT
    product_id,
    category_id,
    name,
    price,
    uom_id,
    is_active,
    updated_at
FROM
    {{ ref('products') }}