#!/usr/bin/env bash

cd /home/ec2-user/inch-backend

if [ "$DEPLOYMENT_GROUP_NAME" == "staging" ]
then
  # create api document
  apidoc -i ./routes/api -o ./apidoc
  apidoc -i ./routes/papi -o ./papidoc

  # generate ddb index-map.json
  cd /home/ec2-user/inch-backend/dev-tools/ddb
  NODE_ENV=staging node create-index-map.js

  # start server
  cd /home/ec2-user/inch-backend
  NODE_ENV=staging pm2 reload pm2-api.json
  NODE_ENV=staging pm2 reload pm2-batch.json
elif [ "$DEPLOYMENT_GROUP_NAME" == "api-production" ]
then
  NODE_ENV=production pm2 reload pm2-api.json
elif [ "$DEPLOYMENT_GROUP_NAME" == "crawler-production" ]
then
  NODE_ENV=production pm2 reload pm2-product-crawler.json
elif [ "$DEPLOYMENT_GROUP_NAME" == "updater-production" ]
then
  pm2 delete all
  NODE_ENV=production pm2 reload pm2-product-updater.json
  pm2 save
elif [ "$DEPLOYMENT_GROUP_NAME" == "batch-production" ]
then
  NODE_ENV=production pm2 reload pm2-batch.json
fi