select
    order_id,
    user_id,
    status_id,
    order_date,
    updated_at
from
    {{ source('raw', 'orders') }}