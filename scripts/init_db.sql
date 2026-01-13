-- создание схемы для сырых данных
CREATE SCHEMA IF NOT EXISTS raw;

-- статусы заказов
CREATE TABLE raw.statuses (
    status_id INT PRIMARY KEY,
    name VARCHAR(9)
);

-- категории товаров
CREATE TABLE raw.categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(10)
);

-- пользователи
CREATE TABLE raw.users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    address TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- товары
CREATE TABLE raw.products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    category_id INT REFERENCES raw.categories(category_id),
    price DECIMAL(10, 2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- заказы
CREATE TABLE raw.orders (
    order_id INT PRIMARY KEY,
    user_id INT REFERENCES raw.users(user_id),
    status_id INT REFERENCES raw.statuses(status_id),
    order_date TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- позиции заказов
CREATE TABLE raw.order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES raw.orders(order_id),
    product_id INT REFERENCES raw.products(product_id),
    quantity INT,
    price_at_purchase DECIMAL(10, 2) -- фикс цены в момент покупки
);

-- единицы измерения
CREATE TABLE raw.units_of_measure (
    uom_id INT PRIMARY KEY,
    name VARCHAR(9) NOT NULL,
    short_name VARCHAR(3) NOT NULL
);