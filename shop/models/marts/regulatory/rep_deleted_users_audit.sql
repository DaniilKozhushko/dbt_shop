{{ config(materialized='table') }}

with users as (
    select * from {{ ref('stg_shop__users') }}
)

select
    user_id,
    updated_at as deletion_date,
    'ACCOUNT_DELETED' as audit_reason
from users
where is_deleted = true