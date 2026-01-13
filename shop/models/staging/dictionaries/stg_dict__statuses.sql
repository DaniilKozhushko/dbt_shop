SELECT
    status_id,
    name
FROM
    {{ ref('statuses') }}