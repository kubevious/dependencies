#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
cd $MY_DIR

echo ""
echo "*** "
echo "*** SETUP NGINX"
echo "*** "

../../../exec-kubectl.sh apply -f deploy.yaml

echo "Pausing for 10..."
sleep 10

../../../exec-kubectl.sh rollout status --namespace ingress-nginx deployment

../../../exec-kubectl.sh wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

../../../exec-kubectl.sh wait --for=condition=complete --timeout=30s  --namespace ingress-nginx job/ingress-nginx-admission-create

../../../exec-kubectl.sh wait --for=condition=complete --timeout=30s  --namespace ingress-nginx job/ingress-nginx-admission-patch

echo "Pausing for 60..."

../../../exec-kubectl.sh rollout status --namespace ingress-nginx deployment

../../../exec-kubectl.sh wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

../../../exec-kubectl.sh wait --for=condition=complete --timeout=30s  --namespace ingress-nginx job/ingress-nginx-admission-create

../../../exec-kubectl.sh wait --for=condition=complete --timeout=30s  --namespace ingress-nginx job/ingress-nginx-admission-patch

echo "Done."
