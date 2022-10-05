#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

source configuration.sh

echo ""
echo "*** "
echo "*** Starting Kubernetes KIND Cluster"
echo "*** "

kind create cluster --name ${K8S_CLUSTER_NAME} --kubeconfig ${K8S_CONFIG_PATH}


echo ""
echo "*** "
echo "*** "
echo "*** "

${MY_DIR}/install-sample-apps.sh