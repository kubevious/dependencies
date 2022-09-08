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
echo "*** Setting up CRDs..."
echo "*** "

./exec-kubectl.sh apply -f ../../helm.git/kubernetes/templates/crds/


echo ""
echo "*** "
echo "*** INSTALL APPS..."
echo "*** "

cd ${MY_DIR}/configs
KUBECONFIG=${K8S_CONFIG_PATH} helmfile apply
