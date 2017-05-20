#!/bin/bash

echo "...Refreshing MYSQL DB... "
./push-2-mysql-server.sh
echo "...DONE DB REFRESH"

echo "...Refreshing APP... "
./push-2-app-server.sh
echo "...DONE APP REFRESH"


