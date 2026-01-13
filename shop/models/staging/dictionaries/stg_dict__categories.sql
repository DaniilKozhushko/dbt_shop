SELECT
    category_id,
    name
FROM
    {{ ref('categories') }}