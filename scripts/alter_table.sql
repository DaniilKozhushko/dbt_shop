-- увеличение лимита символов
ALTER TABLE raw.statuses ALTER COLUMN name TYPE VARCHAR(10);

-- увеличение лимита символов
ALTER TABLE raw.statuses ALTER COLUMN name TYPE VARCHAR(22);

-- добавление ограничений NOT NULL
ALTER TABLE raw.statuses ALTER COLUMN name SET NOT NULL;
ALTER TABLE raw.categories ALTER COLUMN name SET NOT NULL;
ALTER TABLE raw.users
    ALTER COLUMN first_name SET NOT NULL,
    ALTER COLUMN email  SET NOT NULL,
    ALTER COLUMN address SET NOT NULL;
ALTER TABLE raw.products
    ALTER COLUMN name SET NOT NULL,
    ALTER COLUMN category_id  SET NOT NULL,
    ALTER COLUMN price SET NOT NULL;
ALTER TABLE raw.orders
    ALTER COLUMN order_id SET NOT NULL,
    ALTER COLUMN status_id  SET NOT NULL,
    ALTER COLUMN order_date SET NOT NULL;
ALTER TABLE raw.order_items
    ALTER COLUMN quantity SET NOT NULL,
    ALTER COLUMN price_at_purchase SET NOT NULL;

-- изменение PK в таблице order_items на составной
ALTER TABLE raw.order_items DROP CONSTRAINT order_items_pkey;
ALTER TABLE raw.order_items DROP COLUMN order_item_id;
ALTER TABLE raw.order_items ADD PRIMARY KEY (order_id, product_id);