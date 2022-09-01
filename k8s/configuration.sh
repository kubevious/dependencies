#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"

export K8S_CLUSTER_NAME=kubevious-oss-dev
export K8S_CONFIG_PATH=${MY_DIR}/runtime/kube-config.yaml