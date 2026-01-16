with source as (
    select * from {{ source('raw', 'units_of_measure') }}
),

renamed as (
    select
        cast(uom_id as integer) as uom_id,
        cast(name as varchar(9)) as name,
        cast(short_name as varchar(3)) as short_name
    from source
)

select * from renamed