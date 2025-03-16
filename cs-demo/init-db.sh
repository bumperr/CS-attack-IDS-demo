#!/bin/bash

# Wait for MySQL to be ready
sleep 10

# Connect to MySQL and create sample data
docker exec db-server mysql -u root -ppassword << 'SQL'
CREATE DATABASE IF NOT EXISTS customer_db;
USE customer_db;
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  credit_card VARCHAR(25),
  address VARCHAR(255)
);

# Insert sample data
INSERT INTO customers (name, email, credit_card, address)
VALUES 
('Ali Azeem', 'ali@example.com', '4111-1111-1111-1111', '123 Main St'),
('Amzaer', 'Amzar@example.com', '5500-0000-0000-0004', '456 Oak Ave'),
('Izat', 'izat@example.com', '3400-0000-0000-009', '789 Pine Rd');
SQL

echo "Database initialized successfully!"