DROP DATABASE IF EXISTS nikedas_prod;
CREATE DATABASE nikedas_prod;

\c nikedas_prod;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(25),
    about_store TEXT,
    is_active BOOLEAN
);

CREATE TABLE shoes (
    id SERIAL PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(100),
    size DECIMAL(3, 1),
    product_number VARCHAR(50),
    color VARCHAR(100),
    category VARCHAR(50),
    primary_img TEXT,
    secondary_img TEXT[],
    gender VARCHAR(10),
    price DECIMAL(10, 2),
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    seller_id VARCHAR(255) REFERENCES users(uid)
);

CREATE TABLE favorites (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    shoe_id INT REFERENCES shoes(id),
    UNIQUE(user_id, shoe_id)
);
