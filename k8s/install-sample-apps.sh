#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

source configuration.sh

echo ""
echo "*** "
echo "*** Setting Up Sample Apps"
echo "*** "

cd ${MY_DIR}/configs
export KUBECONFIG=${K8S_CONFIG_PATH}
helmfile apply --skip-diff-on-install --concurrency 1
