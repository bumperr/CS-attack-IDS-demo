#!/bin/bash

# Generate normal traffic from within cloud-server

echo "Generating normal traffic..."

# HTTP requests to API gateway
for i in {1..30}; do
    docker exec cloud-server curl -s http://172.18.0.40/api/status > /dev/null
    docker exec cloud-server curl -s http://172.18.0.40/api/data > /dev/null
    sleep 2
done

# MySQL queries
for i in {1..10}; do
    docker exec db-server mysql -u root -ppassword -e "SELECT * FROM customer_db.customers LIMIT 3;"
    sleep 3
done

echo "Normal traffic generation complete"