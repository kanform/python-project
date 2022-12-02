#!/bin/bash

source common/vars.sh
source common/rm_container.sh
source common/create_container.sh

try_count=5

rm_container $container_name
create_container $container_name

for t in $(seq $try_count)
do
  if [ "$(curl -skL http://127.0.0.1:80/healthz.html | grep healthy | tr -d ' ')" == "healthy" ]
  then
    succes="true"
    break
  else
    remain_count=$(( try_count - t ))
    echo "retry (remain count $remain_count...)"
    sleep 1
  fi
done

if [ "${succes}" != "true" ]
then
  echo "Test failed"
else
  echo "Successfully"
  sleep 5
  rm_container $container_name
fi

