with source as (
    select * from {{ source('raw', 'order_items') }}
),

renamed as (
    select
        cast(order_id as integer) as order_id,
        cast(product_id as integer) as product_id,
        cast(quantity as numeric(10, 3)) as quantity,
        cast(price_at_purchase as numeric(10, 2)) as price_at_purchase
    from source
)

select * from renamed