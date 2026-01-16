DROP SCHEMA IF EXISTS raw CASCADE;
CREATE SCHEMA IF NOT EXISTS raw;

CREATE TABLE raw.units_of_measure (
    uom_id INT PRIMARY KEY,
    name VARCHAR(9) NOT NULL,
    short_name VARCHAR(3) NOT NULL
);

CREATE TABLE raw.categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE raw.statuses (
    status_id INT PRIMARY KEY,
    name VARCHAR(22) NOT NULL
);

CREATE TABLE raw.users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL REFERENCES raw.categories(category_id),
    uom_id INT REFERENCES raw.units_of_measure(uom_id),
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL REFERENCES raw.users(user_id),
    status_id INT NOT NULL REFERENCES raw.statuses(status_id),
    order_date TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.order_items (
    order_id INT REFERENCES raw.orders(order_id),
    product_id INT REFERENCES raw.products(product_id),
    quantity DECIMAL(10, 3) NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);