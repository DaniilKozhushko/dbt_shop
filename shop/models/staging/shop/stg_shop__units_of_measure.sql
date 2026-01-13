{{
  config(
    materialized = 'table'
    )
}}

select
    uom_id,
    name,
    short_name
from
    {{ source('raw', 'units_of_measure') }}