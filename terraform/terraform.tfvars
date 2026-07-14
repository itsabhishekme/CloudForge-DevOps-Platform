# ==========================================================
# CloudForge DevOps Platform
# Terraform Variables
# ==========================================================

# ----------------------------------------------------------
# Project
# ----------------------------------------------------------
project_name = "cloudforge-devops-platform"
environment  = "dev"

# ----------------------------------------------------------
# AWS
# ----------------------------------------------------------
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
# EKS
# ----------------------------------------------------------
cluster_name    = "cloudforge-cluster"
cluster_version = "1.31"

node_group_name = "cloudforge-workers"

instance_types = [
  "t3.medium"
]

desired_size = 2
min_size     = 1
max_size     = 3

# ----------------------------------------------------------
# ECR
# ----------------------------------------------------------
ecr_repositories = [
  "cloudforge-frontend",
  "cloudforge-backend"
]

# ----------------------------------------------------------
# EC2 (Optional Bastion/Jenkins)
# ----------------------------------------------------------
ec2_instance_type = "t3.micro"
key_pair_name     = "cloudforge-key"

# ----------------------------------------------------------
# RDS
# (If using Amazon RDS instead of MongoDB Atlas)
# ----------------------------------------------------------
db_identifier     = "cloudforge-db"
db_name           = "cloudforge"
db_username       = "admin"
db_password       = "ChangeThisPassword123!"
db_engine         = "mysql"
db_engine_version = "8.0"

db_instance_class = "db.t3.micro"

allocated_storage = 20

# ----------------------------------------------------------
# S3
# ----------------------------------------------------------
bucket_name = "cloudforge-devops-platform-assets"

# ----------------------------------------------------------
# Route53
# ----------------------------------------------------------
domain_name = "cloudforge.example.com"

# ----------------------------------------------------------
# Tags
# ----------------------------------------------------------
tags = {
  Project     = "CloudForge DevOps Platform"
  Environment = "Development"
  Owner       = "Abhishek Shrivastava"
  ManagedBy   = "Terraform"
}