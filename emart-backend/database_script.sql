-- Roles Table
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL
);

-- Users Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INT REFERENCES roles(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sellers Table
CREATE TABLE sellers (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    store_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Customers Table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Addresses Table
CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES sellers(id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    inventory INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    status VARCHAR(20) DEFAULT 'purchased',
    total_amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- OrderItems Table
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    price DECIMAL(10,2)
);

-- Cart Table
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Wishlist Table
CREATE TABLE wishlist (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    product_id INT REFERENCES products(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
