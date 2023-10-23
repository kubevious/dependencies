#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
DEPS_K8S_MY_DIR="$(dirname $MY_PATH)"

source ${DEPS_K8S_MY_DIR}/configuration.sh

echo "export KUBECONFIG=${K8S_CONFIG_PATH}"
