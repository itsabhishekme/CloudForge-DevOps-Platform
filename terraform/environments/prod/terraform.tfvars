# ==========================================================
# CloudForge DevOps Platform
# Production Environment Variables
# ==========================================================

# ----------------------------------------------------------
# Project
# ----------------------------------------------------------

project_name = "cloudforge-devops-platform"

environment = "prod"

aws_region = "ap-south-1"

# ----------------------------------------------------------
# Networking
# ----------------------------------------------------------

vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

# ----------------------------------------------------------
# EKS
# ----------------------------------------------------------

cluster_name = "cloudforge-prod"

cluster_version = "1.30"

node_group_name = "cloudforge-workers"

instance_type = "t3.medium"

desired_capacity = 2

min_capacity = 2

max_capacity = 5

# ----------------------------------------------------------
# Amazon ECR
# ----------------------------------------------------------

ecr_repository_frontend = "cloudforge/frontend"

ecr_repository_backend = "cloudforge/backend"

# ----------------------------------------------------------
# Application Load Balancer
# ----------------------------------------------------------

alb_name = "cloudforge-alb"

# ----------------------------------------------------------
# Route 53
# Replace with your actual domain
# ----------------------------------------------------------

domain_name = "cloudforge.example.com"

hosted_zone_name = "cloudforge.example.com"

# ----------------------------------------------------------
# S3
# Bucket names must be globally unique
# ----------------------------------------------------------

s3_bucket_name = "cloudforge-prod-assets-123456"

# ----------------------------------------------------------
# Database
# ----------------------------------------------------------

db_engine = "postgres"

db_instance_class = "db.t3.micro"

db_allocated_storage = 20

db_name = "cloudforge"

db_username = "cloudforge"

db_password = "CHANGE_ME"

# ----------------------------------------------------------
# Tags
# ----------------------------------------------------------

tags = {
  Project     = "CloudForge DevOps Platform"
  Environment = "Production"
  ManagedBy   = "Terraform"
  Owner       = "Abhishek Shrivastava"
}