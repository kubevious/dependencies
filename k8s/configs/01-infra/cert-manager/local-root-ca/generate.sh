#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"

K8S_DIR=${MY_DIR}/../../../..
source ${K8S_DIR}/configuration.sh

echo "Creating self-signed CA certificates in ${CA_CERTS_FOLDER}"
if [ ! -f /rootCA.pem ]; then
    echo "Certificates already present."
    exit 0;
fi

# This requires mkcert to be installed/available
echo ${CA_CERTS_FOLDER}
rm -rf ${CA_CERTS_FOLDER}
mkdir -p ${CA_CERTS_FOLDER}
# The CAROOT env variable is used by mkcert to determine where to read/write files
# Reference: https://github.com/FiloSottile/mkcert
CAROOT=${CA_CERTS_FOLDER} mkcert -install