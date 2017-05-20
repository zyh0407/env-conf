#!/bin/bash

if [ $# -eq 0 ]; then
   echo "ERROR: need paf-task-id"
else
   taskId=$1
   action=${2-approve}
   if [ "$action" == "reject" ]; then
	   curl -H "Content-Type: application/json" -X POST -d'{"action": "'$(echo $action)'", "reason":"nsf"}' http://localhost:8080/api/task/$(echo $taskId)/perform
   else
	   curl -H "Content-Type: application/json" -X POST -d'{"action": "'$(echo $action)'", "comment":"all right"}' http://localhost:8080/api/task/$(echo $taskId)/perform
   fi
fi
