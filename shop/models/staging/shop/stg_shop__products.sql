with source as (
    select * from {{ source('raw', 'products') }}
),

renamed as (
    select
        cast(product_id as integer) as product_id,
        cast(category_id as integer) as category_id,
        cast(uom_id as integer) as uom_id, 
        cast(name as varchar(255)) as product_name,
        cast(price as numeric(10, 2)) as price_amt,
        cast(is_active as boolean) as is_active_flg,
        cast(updated_at as timestamp) as updated_ts
    from source
)

select * from renamed