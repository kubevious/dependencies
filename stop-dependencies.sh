#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

./mysql/delete.sh

./redisearch/delete.sh

./k8s/delete.sh

./api-gateway/stop.sh