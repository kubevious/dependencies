#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

echo ""
echo "*** "
echo "*** Starting Redis"
echo "*** "

../redisearch/delete.sh

docker-compose up -d --build
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start Redis."
  exit 1;
fi

echo "export REDIS_HOST=localhost" > ./runtime-configuration.sh
echo "export REDIS_PORT=4070" >> ./runtime-configuration.sh

echo "Redis Listening on: 4070"
echo "Redis UI: http://localhost:4060"