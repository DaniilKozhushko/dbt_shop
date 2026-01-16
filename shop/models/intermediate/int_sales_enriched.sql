{{
    config(
        materialized='ephemeral'
    )
}}

with orders as (
    select * from {{ ref('stg_shop__orders') }}
),

items as (
    select * from {{ ref('stg_shop__order_items') }}
),

products as (
    select * from {{ ref('stg_shop__products') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['items.order_id', 'items.product_id']) }} as order_item_sk,
        
        items.order_id,
        items.product_id,
        orders.user_id,
        orders.status_id,
        
        orders.order_date,
        orders.updated_at as order_updated_at,
        
        items.quantity,
        items.price_at_purchase,
        (items.quantity * items.price_at_purchase) as total_amount_local,
        
        products.name as product_name,
        products.category_id

    from items
    left join orders on items.order_id = orders.order_id
    left join products on items.product_id = products.product_id
)

select * from final