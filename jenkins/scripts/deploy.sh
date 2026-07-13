#!/bin/bash

set -e

echo "=========================================="
echo " CloudForge DevOps Platform"
echo " Deployment Started"
echo "=========================================="

#############################################
# Configuration
#############################################

PROJECT_NAME="cloudforge-devops-platform"
COMPOSE_FILE="docker/docker-compose.prod.yml"

#############################################
# Verify Docker
#############################################

echo ""
echo "Checking Docker..."

docker --version
docker compose version

#############################################
# Stop Existing Containers
#############################################

echo ""
echo "Stopping Existing Containers..."

docker compose -f ${COMPOSE_FILE} down || true

#############################################
# Pull Latest Images (Optional)
#############################################

echo ""
echo "Pulling Latest Images..."

docker compose -f ${COMPOSE_FILE} pull || true

#############################################
# Build Images
#############################################

echo ""
echo "Building Images..."

docker compose -f ${COMPOSE_FILE} build

#############################################
# Start Containers
#############################################

echo ""
echo "Starting Containers..."

docker compose -f ${COMPOSE_FILE} up -d

#############################################
# Wait for Services
#############################################

echo ""
echo "Waiting for services to initialize..."

sleep 10

#############################################
# Show Running Containers
#############################################

echo ""
echo "Running Containers"

docker ps

#############################################
# Cleanup
#############################################

echo ""
echo "Removing Unused Images..."

docker image prune -f

#############################################
# Deployment Complete
#############################################

echo ""
echo "=========================================="
echo " Deployment Successful"
echo "=========================================="

echo ""
echo "Frontend : http://localhost:3000"
echo "Backend  : http://localhost:5000"
echo "MongoDB  : localhost:27017"