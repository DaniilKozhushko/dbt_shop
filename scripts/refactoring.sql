DROP SCHEMA IF EXISTS raw CASCADE;
CREATE SCHEMA raw;

CREATE TABLE raw.statuses (
    status_id INT PRIMARY KEY,
    name VARCHAR(22) NOT NULL
);

CREATE TABLE raw.categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE raw.units_of_measure (
    uom_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    short_name VARCHAR(10) NOT NULL
);

CREATE TABLE raw.products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL REFERENCES raw.categories(category_id),
    uom_id INT REFERENCES raw.units_of_measure(uom_id),
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNLOGGED TABLE raw.users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNLOGGED TABLE raw.orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    status_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNLOGGED TABLE raw.order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL(10, 3) NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

ALTER TABLE raw.users SET (autovacuum_enabled = false);
ALTER TABLE raw.orders SET (autovacuum_enabled = false);
ALTER TABLE raw.order_items SET (autovacuum_enabled = false);