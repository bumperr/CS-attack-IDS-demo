#!/bin/bash

echo "Starting Attack Scenario 1: Unauthorized System Modification"

# Simulate an attacker trying to modify config files
docker exec attacker bash -c "echo 'Attempting to modify cloud config files...' && \
  echo 'config modify security.allow_remote=true' > /tmp/malicious_config && \
  nc -v 172.18.0.20 80 < /tmp/malicious_config"

echo "Attack Scenario 1 Complete"