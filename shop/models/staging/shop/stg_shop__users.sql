with source as (
    select * from {{ source('raw', 'users') }}
),

renamed as (
    select
        cast(user_id as integer) as user_id,
        cast(first_name as varchar(255)) as first_name,
        cast(last_name as varchar(255)) as last_name,
        cast(email as varchar(255)) as email,
        cast(address as text) as address,
        cast(is_deleted as boolean) as is_deleted,
        cast(updated_at as timestamp) as updated_at
    from source
)

select * from renamed