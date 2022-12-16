#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"

source ${MY_DIR}/configuration.sh

echo "Creating self-signed CA certificates for TLS and installing them in the local trust stores"
CA_CERTS_FOLDER=${MY_DIR}/runtime/certs
# This requires mkcert to be installed/available
echo ${CA_CERTS_FOLDER}
rm -rf ${CA_CERTS_FOLDER}
mkdir -p ${CA_CERTS_FOLDER}
# The CAROOT env variable is used by mkcert to determine where to read/write files
# Reference: https://github.com/FiloSottile/mkcert
CAROOT=${CA_CERTS_FOLDER} mkcert -install

echo "Creating K8S secrets with the CA private keys (will be used by the cert-manager CA Issuer)"
kubectl create namespace cert-manager
kubectl -n cert-manager create secret tls my-ca-tls-secret --key=${CA_CERTS_FOLDER}/rootCA-key.pem --cert=${CA_CERTS_FOLDER}/rootCA.pem
