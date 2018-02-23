#!/usr/bin/env bash
set -e

# move to app home directory
cd /home/ec2-user/inch-backend

# defined path
export PATH=$PATH:/usr/local/bin/

# Install modules.
npm update

# Build static resources..
if [ "$DEPLOYMENT_GROUP_NAME" == "staging" ];
then
  cd /home/ec2-user/inch-backend/static/www/
  NODE_ENV=staging webpack --optimize-minimize
elif [ "$DEPLOYMENT_GROUP_NAME" == "api-production" ]
then
  cd /home/ec2-user/inch-backend/static/admin/
  NODE_ENV=production webpack --optimize-minimize
  cd /home/ec2-user/inch-backend/static/www/
  NODE_ENV=production webpack --optimize-minimize
elif [ "$DEPLOYMENT_GROUP_NAME" == "crawler-production" ]
then
  echo 'pass'
elif [ "$DEPLOYMENT_GROUP_NAME" == "updater-production" ]
then
  echo 'pass'
elif [ "$DEPLOYMENT_GROUP_NAME" == "batch-production" ]
then
  echo 'pass'
fi