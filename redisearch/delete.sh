#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

# docker-compose kill
# docker-compose rm -f -v
docker-compose down -v

rm -rf runtime-data

rm ./runtime-configuration.sh