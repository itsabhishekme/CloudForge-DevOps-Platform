#!/bin/bash

set -e

echo "========================================"
echo " CloudForge DevOps Platform"
echo " Build Started"
echo "========================================"

PROJECT_ROOT=$(pwd)

echo "Project Root: $PROJECT_ROOT"

#############################################
# Frontend Build
#############################################

echo ""
echo "Building Frontend..."

cd apps/frontend

npm ci
npm run lint
npm run build

echo "Frontend Build Completed"

cd ../..

#############################################
# Backend Build
#############################################

echo ""
echo "Building Backend..."

cd apps/backend

npm ci
npm run build

echo "Backend Build Completed"

cd ../..

#############################################
# Docker Build
#############################################

echo ""
echo "Building Docker Images..."

docker compose -f docker/docker-compose.prod.yml build

echo "Docker Images Built Successfully"

#############################################
# Summary
#############################################

echo ""
echo "========================================"
echo "Build Completed Successfully"
echo "========================================"