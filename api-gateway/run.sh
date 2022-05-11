#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

echo ""
echo "*** "
echo "*** Starting Caddy API Gateway"
echo "*** "

echo "INSTALL FROM HERE: https://caddyserver.com/docs/install"
echo "Access WEB FROM: http://localhost:4000"

./stop.sh

caddy start -config ./Caddyfile -pidfile process.pid
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "ERROR. Could not start Caddy."
  exit 1;
fi


# ./run-static-server.sh