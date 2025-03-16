#!/bin/bash

echo "Starting Attack Scenario 3: Web Vulnerability Scanning"

# Comprehensive web vulnerability assessment
docker exec attacker bash -c "
    echo 'Scanning for web vulnerabilities...' &&
    
    # Basic nikto web server scan
    nikto -h http://172.18.0.40 &&
    
    # SQLMap database injection testing
    sqlmap -u 'http://172.18.0.40/api/data?id=1' --batch --level=5 --risk=3 \
           --dbms=mysql --dbs &&
    
    # Attempt directory traversal
    dirb http://172.18.0.40 /usr/share/wordlists/dirb/common.txt &&
    
    # Check for potential XSS vulnerabilities
    echo 'Checking for potential XSS...' &&
    curl -s 'http://172.18.0.40/api/data?id=<script>alert(1)</script>'
"

echo "Attack Scenario 3: Web Vulnerability Scanning Complete"