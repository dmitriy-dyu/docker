#!/bin/bash

docker-compose up --build -d
sleep 1
docker-compose ps
echo -e "Done"; 

echo -e "Check HTTP on haproxy_a"; 

curl "http://127.0.0.1:8081/200"; echo
sleep 1

echo -e "Check HTTP on haproxy_b";

curl "http://127.0.0.1:8082/200"; echo
