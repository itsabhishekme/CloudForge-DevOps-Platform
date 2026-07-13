# 🚀 CloudForge DevOps Platform

> A production-ready DevOps portfolio project demonstrating CI/CD, containerization, Kubernetes orchestration, Infrastructure as Code, configuration management, monitoring, logging, and cloud deployment.

![Next.js](https://img.shields.io/badge/Next.js-15-black?logo=next.js)
![React](https://img.shields.io/badge/React-19-61DAFB?logo=react)
![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?logo=typescript)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?logo=kubernetes)
![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-D24939?logo=jenkins)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws)

---

# 📌 Project Overview

CloudForge DevOps Platform is an end-to-end cloud-native DevOps project built to demonstrate modern software delivery practices.

The project includes:

- CI/CD Pipeline using Jenkins
- Docker & Docker Compose
- Kubernetes Deployment
- Infrastructure as Code using Terraform
- Configuration Management using Ansible
- Monitoring using Prometheus & Grafana
- Centralized Logging using ELK Stack
- GitOps using Argo CD
- AWS Cloud Deployment
- Next.js + Node.js + MongoDB Full Stack Application

---

# 🏗 Architecture

```
Developer
      │
      ▼
GitHub Repository
      │
      ▼
GitHub Actions
      │
      ▼
Jenkins Pipeline
      │
      ▼
Run Tests
      │
      ▼
Build Docker Images
      │
      ▼
Docker Registry
      │
      ▼
Terraform Provisioning
      │
      ▼
AWS Infrastructure
      │
      ▼
Ansible Configuration
      │
      ▼
Kubernetes Cluster
      │
      ▼
Argo CD GitOps
      │
      ▼
Application
      │
      ▼
Prometheus + Grafana
      │
      ▼
ELK Stack
```

---

# 💻 Tech Stack

## Frontend

- Next.js
- React
- TypeScript
- Tailwind CSS

## Backend

- Node.js
- Express
- TypeScript
- MongoDB

## DevOps

- Docker
- Docker Compose
- Jenkins
- Kubernetes
- Terraform
- Ansible
- Prometheus
- Grafana
- ELK Stack
- Argo CD

## Cloud

- AWS EC2
- AWS EKS
- AWS RDS
- AWS IAM
- AWS Route53
- AWS CloudFront
- AWS S3
- AWS ACM

---

# 📁 Project Structure

```
cloudforge-devops-platform/

├── apps/
│   ├── frontend/
│   └── backend/
│
├── docker/
├── kubernetes/
├── terraform/
├── ansible/
├── jenkins/
├── monitoring/
├── logging/
├── argocd/
├── nginx/
├── github/
├── docs/
├── scripts/
└── README.md
```

---

# 🚀 Installation

Clone Repository

```bash
git clone git@github.com:itsabhishekme/CloudForge-DevOps-Platform.git

cd CloudForge-DevOps-Platform
```

---

## Install Frontend

```bash
cd apps/frontend

npm install

npm run dev
```

---

## Install Backend

```bash
cd apps/backend

npm install

npm run dev
```

---

## Docker

```bash
docker compose -f docker/docker-compose.yml up --build
```

---

## Production

```bash
docker compose -f docker/docker-compose.prod.yml up --build -d
```

---

## Kubernetes

```bash
kubectl apply -f kubernetes/
```

---

## Terraform

```bash
cd terraform

terraform init

terraform plan

terraform apply
```

---

## Ansible

```bash
ansible-playbook playbooks/docker.yml

ansible-playbook playbooks/nginx.yml
```

---

# ⚙ CI/CD Pipeline

- GitHub Push
- Jenkins Trigger
- Install Dependencies
- Run Tests
- Build Application
- Docker Build
- Docker Compose
- Deploy Application

---

# 🐳 Docker

- Multi-stage Build
- Docker Compose
- Environment Variables
- Production Ready

---

# ☸ Kubernetes

- Deployments
- Services
- ConfigMaps
- Secrets
- Ingress
- Persistent Volumes

---

# 🏗 Infrastructure as Code

Terraform provisions:

- VPC
- EC2
- Security Groups
- Application Load Balancer
- RDS
- IAM

---

# ⚙ Configuration Management

Ansible automates:

- Docker Installation
- Nginx Configuration
- User Management
- Package Installation

---

# 📊 Monitoring

Prometheus

- CPU
- Memory
- Disk
- Containers
- Kubernetes

Grafana

- Dashboards
- Alerts
- Metrics

---

# 📑 Logging

ELK Stack

- Elasticsearch
- Logstash
- Kibana
- Filebeat

---

# 🔄 GitOps

Argo CD

- Auto Sync
- Rollbacks
- Git as Source of Truth

---

# ☁ AWS Services

- EC2
- EKS
- S3
- IAM
- CloudFront
- Route53
- ACM
- CodePipeline
- CodeBuild

---

# 📈 Future Enhancements

- SonarQube Integration
- Trivy Image Scanning
- Helm Charts
- Istio Service Mesh
- Horizontal Pod Autoscaler
- Blue/Green Deployment
- Canary Deployment
- AWS Auto Scaling
- GitHub Container Registry
- OpenTelemetry

---

# 👨‍💻 Author

**Abhishek Shrivastava**

Creative Director | Storyteller | DevOps Enthusiast

GitHub:
https://github.com/itsabhishekme

---

# 📄 License

This project is licensed under the MIT License.

---

## ⭐ If you found this project useful, consider giving it a star.
