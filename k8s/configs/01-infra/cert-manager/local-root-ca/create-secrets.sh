#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"

K8S_DIR=${MY_DIR}/../../../..
source ${K8S_DIR}/configuration.sh

echo "Creating K8S secrets with the CA private keys (will be used by the cert-manager CA Issuer)"
${K8S_DIR}/exec-kubectl.sh create namespace cert-manager
${K8S_DIR}/exec-kubectl.sh -n cert-manager create secret tls my-ca-tls-secret --key=${CA_CERTS_FOLDER}/rootCA-key.pem --cert=${CA_CERTS_FOLDER}/rootCA.pem
