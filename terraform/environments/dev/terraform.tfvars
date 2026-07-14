# ==========================================================
# CloudForge DevOps Platform
# Development Environment Variables
# ==========================================================

# ----------------------------------------------------------
# General
# ----------------------------------------------------------

project_name = "cloudforge-devops-platform"

environment = "dev"

aws_region = "ap-south-1"

# ----------------------------------------------------------
# Networking
# ----------------------------------------------------------

vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

# ----------------------------------------------------------
# Amazon EKS
# ----------------------------------------------------------

cluster_name = "cloudforge-dev-cluster"

cluster_version = "1.31"

node_instance_type = "t3.medium"

desired_nodes = 2

min_nodes = 1

max_nodes = 3

# ----------------------------------------------------------
# Amazon ECR
# ----------------------------------------------------------

frontend_repository = "cloudforge/frontend"

backend_repository = "cloudforge/backend"

# ----------------------------------------------------------
# Application Load Balancer
# ----------------------------------------------------------

alb_name = "cloudforge-dev-alb"

# ----------------------------------------------------------
# S3
# ----------------------------------------------------------

bucket_name = "cloudforge-dev-artifacts"

# ----------------------------------------------------------
# Route 53
# ----------------------------------------------------------

domain_name = "dev.cloudforge.local"

# ----------------------------------------------------------
# Database
# ----------------------------------------------------------

database_name = "cloudforge"

database_username = "cloudforge"

database_password = "ChangeMe123!"

database_instance_class = "db.t3.micro"

database_allocated_storage = 20

# ----------------------------------------------------------
# Tags
# ----------------------------------------------------------

tags = {
  Project     = "CloudForge DevOps Platform"
  Environment = "Development"
  Owner       = "Abhishek Shrivastava"
  ManagedBy   = "Terraform"
}