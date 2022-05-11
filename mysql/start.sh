#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

echo ""
echo "*** "
echo "*** Starting MySQL"
echo "*** "

docker network create kubevious

docker-compose up -d --build
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start MySQL."
  exit 1;
fi
