#!/bin/bash

###############################################################################
# CloudForge DevOps Platform
# Deployment Script
###############################################################################

set -euo pipefail

PROJECT_NAME="CloudForge DevOps Platform"
NAMESPACE="cloudforge"

echo "======================================================"
echo "🚀 ${PROJECT_NAME}"
echo "Deployment Started"
echo "======================================================"

###############################################################################
# Check Required Tools
###############################################################################

echo ""
echo "Checking required tools..."

for tool in docker kubectl; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "❌ $tool is not installed."
        exit 1
    fi
done

echo "✅ All required tools are installed."

###############################################################################
# Build Docker Images
###############################################################################

echo ""
echo "Building Docker images..."

docker compose -f docker/docker-compose.prod.yml build

###############################################################################
# Kubernetes Namespace
###############################################################################

echo ""
echo "Creating namespace..."

kubectl apply -f kubernetes/namespace.yaml

###############################################################################
# Configurations
###############################################################################

echo ""
echo "Applying ConfigMap..."

kubectl apply -f kubernetes/configmap.yaml

echo "Applying Secret..."

kubectl apply -f kubernetes/secret.yaml

###############################################################################
# MongoDB
###############################################################################

echo ""
echo "Deploying MongoDB..."

kubectl apply -f kubernetes/mongodb/

###############################################################################
# Backend
###############################################################################

echo ""
echo "Deploying Backend..."

kubectl apply -f kubernetes/backend/

###############################################################################
# Frontend
###############################################################################

echo ""
echo "Deploying Frontend..."

kubectl apply -f kubernetes/frontend/

###############################################################################
# Ingress
###############################################################################

echo ""
echo "Deploying Ingress..."

kubectl apply -f kubernetes/ingress.yaml

###############################################################################
# Wait
###############################################################################

echo ""
echo "Waiting for Deployments..."

kubectl rollout status deployment/cloudforge-backend -n ${NAMESPACE}
kubectl rollout status deployment/cloudforge-frontend -n ${NAMESPACE}

###############################################################################
# Resources
###############################################################################

echo ""
echo "Pods"

kubectl get pods -n ${NAMESPACE}

echo ""
echo "Services"

kubectl get svc -n ${NAMESPACE}

echo ""
echo "Ingress"

kubectl get ingress -n ${NAMESPACE}

###############################################################################
# Finish
###############################################################################

echo ""
echo "======================================================"
echo "✅ Deployment Completed Successfully"
echo "======================================================"

echo ""
echo "Application URLs"

echo "Frontend : http://cloudforge.local"

echo "Backend  : http://cloudforge.local/api"

echo ""
echo "Monitoring"

echo "Grafana      : http://localhost:3000"
echo "Prometheus   : http://localhost:9090"

echo ""
echo "Finished."