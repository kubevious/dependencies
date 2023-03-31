#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

source configuration.sh

echo ""
echo "*** "
echo "*** GENERATE CA ROOTS"
echo "*** "

${MY_DIR}/configs/01-infra/cert-manager/local-root-ca/generate.sh

echo ""
${MY_DIR}/bring-up-cluster.sh

echo ""
echo "*** "
echo "*** SETUP NGINX"
echo "*** "

./configs/01-infra/nginx/deploy.sh

echo ""
echo "*** "
echo "*** SETUP CA ROOT SECRET"
echo "*** "
${MY_DIR}/configs/01-infra/cert-manager/local-root-ca/create-secrets.sh

echo ""
echo "*** "
echo "*** Installing Sample Apps"
echo "*** "

${MY_DIR}/install-sample-apps.sh