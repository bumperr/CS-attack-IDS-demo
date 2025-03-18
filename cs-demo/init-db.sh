#!/bin/bash

# Function to wait for MySQL to be ready
wait_for_mysql() {
  echo "Waiting for MySQL to be ready..."
  until docker exec db-server mysql -u root -ppassword -e "SELECT 1" &> /dev/null; do
    echo "MySQL not ready yet, waiting..."
    sleep 2
  done
  echo "MySQL is ready!"
}

# Call the wait function
wait_for_mysql

# Connect to MySQL and create sample data
docker exec db-server mysql -u root -ppassword << 'SQL'
DROP DATABASE IF EXISTS customer_db;
CREATE DATABASE IF NOT EXISTS customer_db;
USE customer_db;
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  credit_card VARCHAR(25),
  address VARCHAR(255)
);

INSERT INTO customers (name, email, credit_card, address)
VALUES 
('Ali Azeem', 'ali@example.com', '4111-1111-1111-1111', '123 Main St'),
('Amzaer', 'amzar@example.com', '5500-0000-0000-0004', '456 Oak Ave'),
('Izat', 'izat@example.com', '3400-0000-0000-0009', '789 Pine Rd');
SQL

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Database initialized successfully!"
else
  echo "Error: Database initialization failed."
  exit 1
fi