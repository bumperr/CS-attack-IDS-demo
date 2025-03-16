#!/bin/bash

echo "Starting Attack Scenario 1: Network Reconnaissance and Scanning"

# Perform network discovery and port scanning
docker exec attacker bash -c "
    echo 'Performing network discovery...' &&
    nmap -sn 172.18.0.0/24 &&
    
    echo 'Detailed port scanning of target hosts...' &&
    nmap -sV -p- 172.18.0.20 172.18.0.30 172.18.0.40 &&
    
    echo 'Stealth SYN scan to identify open ports...' &&
    nmap -sS -p80,3306,22 172.18.0.0/24 &&
    
    echo 'OS and service version detection...' &&
    nmap -O -sV 172.18.0.20
"

echo "Attack Scenario 1: Network Reconnaissance Complete"