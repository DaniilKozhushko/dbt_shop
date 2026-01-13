select
    user_id,
    first_name,
    last_name,
    email,
    address,
    updated_at,
    is_deleted
from
    {{ source('raw', 'users') }}