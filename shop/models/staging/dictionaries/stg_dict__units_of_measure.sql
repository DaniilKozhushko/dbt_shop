SELECT
    uom_id,
    name,
    short_name
FROM
    {{ ref('units_of_measure') }}