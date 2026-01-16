with source as (
    select * from {{ source('raw', 'products') }}
),

renamed as (
    select
        cast(product_id as integer) as product_id,
        cast(name as varchar(255)) as name,
        cast(category_id as integer) as category_id,
        cast(uom_id as integer) as uom_id,
        cast(price as numeric(10, 2)) as price,
        cast(is_active as boolean) as is_active,
        cast(updated_at as timestamp) as updated_at
    from source
)

select * from renamed