#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

docker network create kubevious

./mysql/start.sh
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start MySQL."
  exit 1;
fi

./redisearch/start.sh
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start Redis."
  exit 1;
fi

./k8s/start.sh
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start K8s Cluster."
  exit 1;
fi

./api-gateway/run.sh
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start Caddy API Gateway."
  exit 1;
fi
