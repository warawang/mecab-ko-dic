#!/usr/bin/env bash

if [ "$DEPLOYMENT_GROUP_NAME" == "staging" ] || [ "$DEPLOYMENT_GROUP_NAME" == "api-production" ]
then
  sleep 5
  nc -zv 127.0.0.1 8000
fi