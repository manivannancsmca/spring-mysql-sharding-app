CREATE DATABASE IF NOT EXISTS product_lookup_db;
USE product_lookup_db;

CREATE TABLE IF NOT EXISTS product_search_index (
    product_id VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    brandname VARCHAR(100) NOT NULL,
    shard_id INT NOT NULL,
    PRIMARY KEY (product_id),
    INDEX idx_search (brandname, name)
);