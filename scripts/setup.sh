#!/bin/bash

###############################################################################
# CloudForge DevOps Platform
# Environment Setup Script
###############################################################################

set -euo pipefail

PROJECT_NAME="CloudForge DevOps Platform"

echo "======================================================"
echo "🚀 ${PROJECT_NAME}"
echo "Environment Setup"
echo "======================================================"

###############################################################################
# Check Required Tools
###############################################################################

REQUIRED_TOOLS=(
    git
    node
    npm
    docker
    kubectl
)

echo ""
echo "Checking required tools..."

for tool in "${REQUIRED_TOOLS[@]}"
do
    if command -v "$tool" >/dev/null 2>&1
    then
        echo "✅ $tool installed"
    else
        echo "❌ $tool not found"
        exit 1
    fi
done

###############################################################################
# Install Frontend
###############################################################################

echo ""
echo "Installing Frontend Dependencies..."

cd apps/frontend

npm install

cd ../..

###############################################################################
# Install Backend
###############################################################################

echo ""
echo "Installing Backend Dependencies..."

cd apps/backend

npm install

cd ../..

###############################################################################
# Environment Files
###############################################################################

echo ""
echo "Checking environment files..."

if [ ! -f apps/backend/.env ]; then

cat > apps/backend/.env <<EOF
PORT=5000
CLIENT_URL=http://localhost:3000
MONGO_URI=mongodb://localhost:27017/cloudforge
NODE_ENV=development
EOF

echo "✅ Backend .env created"

else
echo "Backend .env already exists"
fi

if [ ! -f apps/frontend/.env.local ]; then

cat > apps/frontend/.env.local <<EOF
NEXT_PUBLIC_API_URL=http://localhost:5000/api
NEXT_TELEMETRY_DISABLED=1
EOF

echo "✅ Frontend .env.local created"

else
echo "Frontend .env.local already exists"
fi

###############################################################################
# Docker
###############################################################################

echo ""
echo "Building Docker Images..."

docker compose -f docker/docker-compose.yml build

###############################################################################
# Kubernetes Namespace
###############################################################################

echo ""
echo "Creating Kubernetes Namespace..."

kubectl apply -f kubernetes/namespace.yaml || true

###############################################################################
# Finish
###############################################################################

echo ""
echo "======================================================"
echo "✅ Setup Completed Successfully"
echo "======================================================"

echo ""
echo "Next Steps"

echo "1. Start Development"

echo "   npm run dev"

echo ""
echo "2. Start Docker"

echo "   docker compose -f docker/docker-compose.yml up"

echo ""
echo "3. Deploy Kubernetes"

echo "   ./scripts/deploy.sh"

echo ""
echo "4. Destroy Resources"

echo "   ./scripts/destroy.sh"

echo ""
echo "Happy Coding 🚀"