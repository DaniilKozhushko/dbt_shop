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
    ALTER COLUMN user_id SET NOT NULL,
    ALTER COLUMN status_id  SET NOT NULL,
    ALTER COLUMN order_date SET NOT NULL;
ALTER TABLE raw.order_items
    ALTER COLUMN quantity SET NOT NULL,
    ALTER COLUMN price_at_purchase SET NOT NULL;

-- изменение PK в таблице order_items на составной
ALTER TABLE raw.order_items DROP CONSTRAINT order_items_pkey;
ALTER TABLE raw.order_items DROP COLUMN order_item_id;
ALTER TABLE raw.order_items ADD PRIMARY KEY (order_id, product_id);

-- добавление ограничения больше 0
ALTER TABLE raw.order_items ADD CONSTRAINT quantity_min_check CHECK (quantity > 0);

-- изменение типа данных в столбце
ALTER TABLE raw.order_items ALTER COLUMN quantity TYPE DECIMAL(10, 3);

-- добавление нового столбца
ALTER TABLE raw.products ADD COLUMN uom_id INT;

-- добавление связи
ALTER TABLE raw.products
    ADD CONSTRAINT fk_products_uom FOREIGN KEY (uom_id)
    REFERENCES raw.units_of_measure(uom_id);

-- добавление полей is_deleted
ALTER TABLE raw.users ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;
ALTER TABLE raw.products ADD COLUMN is_active BOOLEAN DEFAULT FALSE;

-- добавление индексов
CREATE INDEX idx_raw_orders_order_id ON raw.orders(order_id);
CREATE INDEX idx_raw_order_items_order_id ON raw.order_items(order_id);
CREATE INDEX idx_raw_products_product_id ON raw.products(product_id);