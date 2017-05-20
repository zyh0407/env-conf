#!/usr/bin/env bash

process=accountTransfer
amt=${1-12000}
curl -H "Content-Type: application/json" -X POST -d'{"fromAccount": "465-94778", "amount":"'$(echo $amt)'", "toAccount": "648-93838"}' http://localhost:8080/api/processDef/${process}/start

