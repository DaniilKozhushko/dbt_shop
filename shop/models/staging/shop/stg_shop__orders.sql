with source as (
    select * from {{ source('raw', 'orders') }}
),

renamed as (
    select
        cast(order_id as integer) as order_id,
        cast(user_id as integer) as user_id,
        cast(status_id as integer) as status_id,
        cast(order_date as timestamp) as order_date,
        cast(updated_at as timestamp) as updated_at
    from source
)

select * from renamed