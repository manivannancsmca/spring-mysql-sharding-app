CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    brandname VARCHAR(100) NOT NULL,
    quantity INT DEFAULT 0,
    price DECIMAL(10,2) DEFAULT 0.00,
    creationdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id)
);