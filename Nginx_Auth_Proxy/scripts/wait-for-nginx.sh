#!/bin/bash

command='wget --no-check-certificate -q https://localhost:6443/elb-status -O /dev/null';
server_started_status_code=0;
status=-1;

until [[ $status == $server_started_status_code ]]
do
  sleep 1;
  printf "*"
  eval $command;
  status=$?
done