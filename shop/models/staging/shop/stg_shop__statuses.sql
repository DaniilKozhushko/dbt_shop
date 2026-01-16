with source as (
    select * from {{ source('raw', 'statuses') }}
),

renamed as (
    select
        cast(status_id as integer) as status_id,
        cast(name as varchar(22)) as name
    from source
)

select * from renamed