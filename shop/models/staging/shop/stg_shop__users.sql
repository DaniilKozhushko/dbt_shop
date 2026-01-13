{{
  config(
    materialized = 'table'
    )
}}

select
    user_id,
    first_name,
    last_name,
    email,
    address,
    updated_at
from
    {{ source('raw', 'users') }}