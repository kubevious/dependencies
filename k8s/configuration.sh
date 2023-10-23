#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
DEPS_K8S_MY_DIR="$(dirname $MY_PATH)"

export K8S_CLUSTER_NAME=kubevious-oss-dev
export KUBECONFIG=${DEPS_K8S_MY_DIR}/runtime/kube-config.yaml
export K8S_CONFIG_PATH=${KUBECONFIG}

export CA_CERTS_FOLDER=${DEPS_K8S_MY_DIR}/runtime/certs