CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    brandname VARCHAR(100) NOT NULL,
    quantity INT DEFAULT 0,
    price DECIMAL(10,2) DEFAULT 0.00,
    creationdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id)
);

-- =========================================================================
-- SHARD 1 DATA
-- =========================================================================
SELECT DATABASE() INTO @current_db;

IF @current_db = 'product_shard_1' THEN
    INSERT INTO products (product_id, name, brandname, quantity, price, creationdate) VALUES
    ('042d38db-c82b-4d43-9871-3343ef0c7c01', 'Pro Wireless Mouse Pro', 'Logitech', 150, 8999.00, '2026-01-10 10:00:00'),
    ('1bf6d24d-e902-4b2a-a92c-567e9b0b1c06', 'ThinkPad E14 Laptop', 'Lenovo', 45, 62000.00, '2026-01-15 11:30:00'),
    ('28cf4d88-b2a8-4221-a39c-c51ef67ab011', 'OLED 55 inch TV', 'LG', 20, 115000.00, '2026-01-20 14:20:00'),
    ('3a4c5e6f-7b8c-4d9e-a0f1-2b3c4d5e6f16', 'Galaxy Tab S9', 'Samsung', 35, 74999.00, '2026-01-25 09:15:00'),
    ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f21', 'AirPods Pro 2', 'Apple', 200, 24900.00, '2026-02-01 16:45:00'),
    ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a26', 'MacBook Air M3', 'Apple', 60, 114900.00, '2026-02-05 10:10:00'),
    ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b31', 'UltraSharp 27 Monitor', 'Dell', 40, 32500.00, '2026-02-10 13:00:00'),
    ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c36', 'Crucial X9 Pro 2TB', 'Micron', 90, 14500.00, '2026-02-15 15:30:00'),
    ('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d41', 'QuietComfort Ultra', 'Bose', 75, 35900.00, '2026-02-20 17:00:00'),
    ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e46', 'WD Black SN850X 1TB', 'Western Digital', 120, 9500.00, '2026-02-25 11:00:00'),
    ('a0b1c2d3-e4f5-6a7b-8c9d-0e1f2a3b4c51', 'Instinct 2 Solar', 'Garmin', 25, 42000.00, '2026-03-01 08:45:00'),
    ('b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d56', 'Razer Viper V3 Pro', 'Razer', 55, 13999.00, '2026-03-05 12:15:00'),
    ('c2d3e4f5-a6b7-8c9d-0e1f-2a3b4c5d6e61', 'GoPro HERO12 Black', 'GoPro', 80, 45000.00, '2026-03-10 14:00:00'),
    ('d3e4f5a6-b7c8-9d0e-1f2a-3b4c5d6e7f66', 'Kindle Paperwhite', 'Amazon', 140, 14999.00, '2026-03-15 16:20:00'),
    ('e4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a71', 'PlayStation VR2', 'Sony', 15, 57999.00, '2026-03-20 18:30:00'),
    ('f5a6b7c8-d9e0-1f2a-3b4c-5d6e7f8a9b76', 'Nest Thermostat', 'Google', 30, 18999.00, '2026-03-25 10:00:00'),
    ('098f6bcd-4621-3373-b47e-bb3151497f81', 'Apex Pro TKL Keyboard', 'SteelSeries', 40, 19999.00, '2026-03-30 11:45:00'),
    ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c86', 'Soundcore Anker P20i', 'Anker', 300, 1999.00, '2026-04-02 09:00:00'),
    ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d91', 'Lacie Rugged Mini 2TB', 'Seagate', 50, 12500.00, '2026-04-05 15:10:00'),
    ('3c4d5e6f-7a8b-9c0d-0d1e-2f3a4b5c6d96', 'Surface Laptop 6', 'Microsoft', 22, 124999.00, '2026-04-10 13:40:00');
END IF;

-- =========================================================================
-- SHARD 2 DATA
-- =========================================================================
IF @current_db = 'product_shard_2' THEN
    INSERT INTO products (product_id, name, brandname, quantity, price, creationdate) VALUES
    ('0e3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b02', 'MX Keys S Keyboard', 'Logitech', 110, 12995.00, '2026-01-11 10:30:00'),
    ('1f4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c07', 'Legion Pro 5 Gaming', 'Lenovo', 25, 145000.00, '2026-01-16 12:00:00'),
    ('2a5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8d12', 'C3 OLED 65 inch TV', 'LG', 12, 185000.00, '2026-01-21 15:00:00'),
    ('3b6d7e8f-9a0b-1c2d-3e4f-5a6b7c8d9e17', 'Galaxy S24 Ultra', 'Samsung', 85, 129999.00, '2026-01-26 09:45:00'),
    ('4c7e8f9a-0b1c-2d3e-4f5a-6b7c8d9e0f22', 'iPhone 15 Pro Max', 'Apple', 95, 148900.00, '2026-02-02 17:00:00'),
    ('5d8f9a0b-1c2d-3e4f-5a6b-7c8d9e0f1a27', 'MacBook Pro 16 M3', 'Apple', 30, 249900.00, '2026-02-06 10:30:00'),
    ('6e9a0b1c-2d3e-4f5a-6b7c-8d9e0f1a2b32', 'Alienware 34 Curved', 'Dell', 18, 92000.00, '2026-02-11 14:15:00'),
    ('7f0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c37', 'Crucial T700 1TB', 'Micron', 65, 18500.00, '2026-02-16 16:00:00'),
    ('8a1c2d3e-4f5a-6b7c-8d9e-0f1a2b3c4d42', 'QuietComfort Headphones', 'Bose', 90, 29900.00, '2026-02-21 17:30:00'),
    ('9b2d3e4f-5a6b-7c8d-9e0f-1a2b3c4d5e47', 'WD Blue SA510 1TB', 'Western Digital', 150, 6800.00, '2026-02-26 11:30:00'),
    ('a1c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d52', 'Forerunner 965', 'Garmin', 20, 65000.00, '2026-03-02 09:15:00'),
    ('b2d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e57', 'Razer DeathAdder V3', 'Razer', 70, 7499.00, '2026-03-06 13:00:00'),
    ('c3e5f6a7-b8c9-0d1e-2f3a-4b5c6d7e8f62', 'GoPro Max 360', 'GoPro', 35, 47000.00, '2026-03-11 14:30:00'),
    ('d4f6a7b8-c9d0-1e2f-3a4b-5c6d7e8f9a67', 'Kindle Scribe', 'Amazon', 50, 34999.00, '2026-03-16 16:45:00'),
    ('e5a7b8c9-d0e1-2f3a-4b5c-6d7e8f9a0b72', 'DualSense Edge Controller', 'Sony', 45, 18990.00, '2026-03-21 19:00:00'),
    ('f6b8c9d0-e1f2-3a4b-5c6d-7e8f9a0b1c77', 'Nest Cam Outdoor', 'Google', 40, 16500.00, '2026-03-26 10:30:00'),
    ('0ad1c2b3-4e5f-6a7b-8c9d-0e1f2a3b4c82', 'Arctis Nova Pro Wireless', 'SteelSeries', 25, 32999.00, '2026-04-01 11:00:00'),
    ('1bc2d3e4-5f6a-7b8c-9d0e-1f2a3b4c5d87', 'Anker 737 Power Bank', 'Anker', 120, 10999.00, '2026-04-03 09:30:00'),
    ('2cd3e4f5-6a7b-8c9d-0e1f-2a3b4c5d6e92', 'Expansion Desktop 4TB', 'Seagate', 75, 9999.00, '2026-04-06 15:40:00'),
    ('3de4f5a6-7b8c-9d0e-1f2a-3b4c5d6e7f97', 'Surface Pro 10', 'Microsoft', 15, 115999.00, '2026-04-11 14:00:00');
END IF;

-- =========================================================================
-- SHARD 3 DATA
-- =========================================================================
IF @current_db = 'product_shard_3' THEN
    INSERT INTO products (product_id, name, brandname, quantity, price, creationdate) VALUES
    ('0a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c03', 'G502 X Plus Mouse', 'Logitech', 130, 14995.00, '2026-01-12 11:00:00'),
    ('1b2c3d4e-5f6a-7b8c-9d0e-1f2a3b4c5d08', 'ThinkCentre Neo 50s', 'Lenovo', 30, 45000.00, '2026-01-17 13:00:00'),
    ('2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e13', 'NanoCell 75 Series 43', 'LG', 25, 38000.00, '2026-01-22 15:30:00'),
    ('3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f18', 'Galaxy Watch 6 Pro', 'Samsung', 90, 36000.00, '2026-01-27 10:00:00'),
    ('4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a23', 'iPad Pro 11 M2', 'Apple', 50, 81900.00, '2026-02-03 17:30:00'),
    ('5f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b28', 'Mac Studio M2 Ultra', 'Apple', 10, 419900.00, '2026-02-07 11:00:00'),
    ('6a7b8c9d-0e1f-2a3b-4c5d-6e7f8a9b0c33', 'Inspiron 15 Laptop', 'Dell', 55, 48000.00, '2026-02-12 14:45:00'),
    ('7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d38', 'Crucial P3 Plus 4TB', 'Micron', 40, 22500.00, '2026-02-17 16:30:00'),
    ('8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e43', 'Bose Ultra Soundbar', 'Bose', 30, 99900.00, '2026-02-22 18:00:00'),
    ('9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f48', 'WD My Passport 5TB', 'Western Digital', 85, 11500.00, '2026-02-27 12:00:00'),
    ('a2b4c5d6-e7f8-9a0b-1c2d-3e4f5a6b7c53', 'Venu 3 Smartwatch', 'Garmin', 35, 45000.00, '2026-03-03 10:00:00'),
    ('b3c5d6e7-f8a9-0b1c-2d3e-4f5a6b7c8d58', 'Razer BlackWidow V4', 'Razer', 45, 16999.00, '2026-03-07 13:30:00'),
    ('c4d6e7f8-a9b0-1c2d-3e4f-5a6b7c8d9e63', 'GoPro HERO11 Mini', 'GoPro', 60, 32000.00, '2026-03-12 15:00:00'),
    ('d5e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f68', 'Kindle Kids Edition', 'Amazon', 70, 9999.00, '2026-03-17 17:00:00'),
    ('e6f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a73', 'PS5 Digital Edition', 'Sony', 65, 44990.00, '2026-03-22 19:30:00'),
    ('f7a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b78', 'Nest Doorbell Wired', 'Google', 28, 14999.00, '2026-03-27 11:00:00'),
    ('0be2c3d4-5f6a-7b8c-9d0e-1f2a3b4c5d83', 'BlackShark V2 Pro', 'Razer', 80, 15999.00, '2026-04-01 11:30:00'),
    ('1cf3d4e5-6f7a-8b9c-0d1e-2f3a4b5c6d88', 'Anker 521 Power Station', 'Anker', 40, 21999.00, '2026-04-03 10:00:00'),
    ('2df4e5f6-7a8b-9c0d-1e2f-3a4b5c6d7e93', 'One Touch HDD 2TB', 'Seagate', 110, 6500.00, '2026-04-06 16:00:00'),
    ('3ef5a6b7-8b9c-0d1e-2f3a-4b5c6d7e8f98', 'Surface Studio 2+', 'Microsoft', 5, 450000.00, '2026-04-12 14:30:00');
END IF;

-- =========================================================================
-- SHARD 4 DATA
-- =========================================================================
IF @current_db = 'product_shard_4' THEN
    INSERT INTO products (product_id, name, brandname, quantity, price, creationdate) VALUES
    ('0b2c3d4e-5f6a-7b8c-9d0e-1f2a3b4c5d04', 'Brio 4K Webcam', 'Logitech', 70, 18995.00, '2026-01-13 11:30:00'),
    ('1c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e09', 'Yoga Book 9i Dual', 'Lenovo', 12, 225000.00, '2026-01-18 14:00:00'),
    ('2d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f14', 'UR750 4K Monitor', 'Samsung', 30, 29999.00, '2026-01-23 16:00:00'),
    ('3e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a19', 'Galaxy Buds 2 Pro', 'Samsung', 140, 15999.00, '2026-01-28 10:30:00'),
    ('4f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b24', 'iPad Air M1', 'Apple', 65, 54900.00, '2026-02-04 18:00:00'),
    ('5a7b8c9d-0e1f-2a3b-4c5d-6e7f8a9b0c29', 'Mac Mini M2 Pro', 'Apple', 25, 129900.00, '2026-02-08 11:30:00'),
    ('6b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d34', 'Vostro 3520 Laptop', 'Dell', 80, 39500.00, '2026-02-13 15:00:00'),
    ('7c8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d39', 'Crucial T500 2TB', 'Micron', 85, 16500.00, '2026-02-18 17:00:00'),
    ('8d9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e44', 'Smart Ultra Soundbar', 'Bose', 20, 79900.00, '2026-02-23 18:30:00'),
    ('9e0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f49', 'WD Elements 1TB', 'Western Digital', 210, 4800.00, '2026-02-28 12:30:00'),
    ('a3b5c6d7-e8f9-0a1b-2c3d-4e5f6a7b8c54', 'Fenix 7X Pro', 'Garmin', 18, 85000.00, '2026-03-04 10:30:00'),
    ('b4c6d7e8-f9a0-1b2c-3d4e-5f6a7b8c9d59', 'Razer Huntsman V3 Pro', 'Razer', 35, 22999.00, '2026-03-08 14:00:00'),
    ('c5d7e8f9-a0b1-2c3d-4e5f-6a7b8c9d0e64', 'GoPro Max Lens Mod', 'GoPro', 40, 9500.00, '2026-03-13 15:30:00'),
    ('d6e7f8a9-b0c1-2d3e-4f5a-6b7c8d9e0f69', 'Kindle Oasis 32GB', 'Amazon', 30, 21999.00, '2026-03-18 17:30:00'),
    ('e7f8a9b0-c1d2-3e4f-5a6b-7c8d9e0f1a74', 'PlayStation 5 Slim', 'Sony', 90, 44990.00, '2026-03-22 20:00:00'),
    ('f8a9b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b79', 'Nest Hub Max 10inch', 'Google', 24, 22999.00, '2026-03-28 11:30:00'),
    ('0cf3d4e5-6f7a-8b9c-0d1e-2f3a4b5c6d84', 'Stratus Duo Controller', 'SteelSeries', 60, 5999.00, '2026-04-01 12:00:00'),
    ('1df4e5f6-7a8b-9c0d-1e2f-3a4b5c6d7e89', 'Anker 622 Magnetic', 'Anker', 150, 3999.00, '2026-04-03 10:30:00'),
    ('2ef5a6b7-8b9c-0d1e-2f3a-4b5c6d7e8f94', 'FireCuda 530 2TB', 'Seagate', 45, 18500.00, '2026-04-06 16:30:00'),
    ('3ff6b7c8-9c0d-1e2f-3a4b-5c6d7e8f9a99', 'Surface Hub 3 50inch', 'Microsoft', 2, 850000.00, '2026-04-13 15:00:00');
END IF;

-- =========================================================================
-- SHARD 5 DATA
-- =========================================================================
IF @current_db = 'product_shard_5' THEN
    INSERT INTO products (product_id, name, brandname, quantity, price, creationdate) VALUES
    ('0c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e05', 'G Pro X 2 Headset', 'Logitech', 85, 24995.00, '2026-01-14 12:00:00'),
    ('1d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f10', 'ThinkPad X1 Carbon', 'Lenovo', 15, 195000.00, '2026-01-19 14:30:00'),
    ('2e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a15', 'QNED80 75 inch 4K', 'LG', 8, 145000.00, '2026-01-24 16:30:00'),
    ('3f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b20', 'Galaxy SmartTag 2', 'Samsung', 250, 2999.00, '2026-01-29 11:00:00'),
    ('4a7b8c9d-0e1f-2a3b-4c5d-6e7f8a9b0c25', 'Apple Watch Ultra 2', 'Apple', 70, 89900.00, '2026-02-05 18:30:00'),
    ('5b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d30', 'iMac 24 inch M3', 'Apple', 20, 134900.00, '2026-02-09 12:00:00'),
    ('6c9b0c1d-2e3f-4a5b-6c7d-8e9f0a1b2c35', 'Latitude 7440 Laptop', 'Dell', 35, 88000.00, '2026-02-14 15:30:00'),
    ('7d0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d40', 'Crucial MX500 1TB', 'Micron', 140, 7500.00, '2026-02-19 17:30:00'),
    ('8e1d2e3f-4a5b-6c7d-8e9f-0a1b2c3d4e45', 'Bose QuietComfort Ultra', 'Bose', 65, 39900.00, '2026-02-24 19:00:00'),
    ('9f2d3e4f-5a6b-7c8d-9e0f-1a2b3c4d5e50', 'WD Red Plus 4TB NAS', 'Western Digital', 60, 12800.00, '2026-03-01 13:00:00'),
    ('a4b6c7d8-e9f0-1a2b-3c4d-5e6f7a8b9c55', 'Approach S70 Golf', 'Garmin', 12, 68000.00, '2026-03-05 11:00:00'),
    ('b5c7d8e9-f0a0-1b2c-3d4e-5f6a7b8c9d60', 'Razer Leviathan V2', 'Razer', 25, 24999.00, '2026-03-09 14:30:00'),
    ('c6d8e9f0-a0b1-2c3d-4e5f-6a7b8c9d0e65', 'GoPro Media Mod', 'GoPro', 50, 8500.00, '2026-03-14 16:00:00'),
    ('d7e8f9a0-b0c1-2d3e-4f5a-6b7c8d9e0f70', 'Kindle 11th Gen 16GB', 'Amazon', 180, 9999.00, '2026-03-19 18:00:00'),
    ('e8f9a0b0-c1d2-3e4f-5a6b-7c8d9e0f1a75', 'PlayStation Portal', 'Sony', 40, 18990.00, '2026-03-23 20:30:00'),
    ('f9a0b0c1-d2e3-4f5a-6b7c-8d9e0f1a2b80', 'Nest Wifi Pro Wi-Fi 6E', 'Google', 30, 32999.00, '2026-03-29 12:00:00'),
    ('0df4e5f6-7a8b-9c0d-1e2f-3a4b5c6d7e85', 'QcK Heavy Mousepad', 'SteelSeries', 500, 1299.00, '2026-04-01 12:30:00'),
    ('1ef5a6b7-8b9c-0d1e-2f3a-4b5c6d7e8f90', 'Anker 551 USB-C Hub', 'Anker', 95, 4999.00, '2026-04-03 11:00:00'),
    ('2ff6b7c8-9c0d-1e2f-3a4b-5c6d7e8f9a95', 'IronWolf Pro 8TB', 'Seagate', 20, 23500.00, '2026-04-06 17:00:00'),
    ('3a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c99', 'Surface Laptop Studio 2', 'Microsoft', 8, 219999.00, '2026-04-14 15:30:00');
END IF;