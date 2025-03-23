@echo off
docker exec -it attacker bash -c "
for i in {1..25}; do 
    nmap -sS -p 3306 172.18.0.30 -max-rate 10;
    sleep 0.2;
done
"