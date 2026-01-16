with source as (
    select * from {{ source('raw', 'categories') }}
),

renamed as (
    select
        cast(category_id as integer) as category_id,
        cast(name as varchar(20)) as name
    from source
)

select * from renamed