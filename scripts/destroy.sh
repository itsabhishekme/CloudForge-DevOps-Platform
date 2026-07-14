#!/bin/bash

###############################################################################
# CloudForge DevOps Platform
# Destroy Script
###############################################################################

set -euo pipefail

PROJECT_NAME="CloudForge DevOps Platform"
NAMESPACE="cloudforge"

echo "======================================================"
echo "🗑️  ${PROJECT_NAME}"
echo "Destroy Started"
echo "======================================================"

###############################################################################
# Check Required Tools
###############################################################################

echo ""
echo "Checking required tools..."

for tool in kubectl docker; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "❌ $tool is not installed."
        exit 1
    fi
done

echo "✅ Required tools found."

###############################################################################
# Confirmation
###############################################################################

echo ""
echo "WARNING!"
echo "This will remove:"
echo "  • Frontend"
echo "  • Backend"
echo "  • MongoDB"
echo "  • Ingress"
echo "  • ConfigMap"
echo "  • Secrets"
echo "  • Namespace"
echo "  • Docker containers"
echo "  • Docker network"

read -p "Continue? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo "Operation cancelled."
    exit 0
fi

###############################################################################
# Kubernetes Resources
###############################################################################

echo ""
echo "Removing Ingress..."

kubectl delete -f kubernetes/ingress.yaml --ignore-not-found=true

echo "Removing Frontend..."

kubectl delete -f kubernetes/frontend/ --ignore-not-found=true

echo "Removing Backend..."

kubectl delete -f kubernetes/backend/ --ignore-not-found=true

echo "Removing MongoDB..."

kubectl delete -f kubernetes/mongodb/ --ignore-not-found=true

echo "Removing ConfigMap..."

kubectl delete -f kubernetes/configmap.yaml --ignore-not-found=true

echo "Removing Secret..."

kubectl delete -f kubernetes/secret.yaml --ignore-not-found=true

echo "Removing Namespace..."

kubectl delete namespace ${NAMESPACE} --ignore-not-found=true

###############################################################################
# Docker
###############################################################################

echo ""
echo "Stopping Docker Compose..."

docker compose -f docker/docker-compose.prod.yml down --remove-orphans || true

###############################################################################
# Cleanup
###############################################################################

echo ""
echo "Cleaning Docker..."

docker container prune -f || true
docker image prune -f || true
docker network prune -f || true
docker volume prune -f || true

###############################################################################
# Finish
###############################################################################

echo ""
echo "======================================================"
echo "✅ CloudForge DevOps Platform Removed"
echo "======================================================"

echo ""
echo "Cleanup completed successfully."