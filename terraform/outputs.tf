#############################################
# CloudForge DevOps Platform
# Terraform Outputs
#############################################

# ===========================================
# VPC
# ===========================================

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# ===========================================
# EKS
# ===========================================

output "eks_cluster_name" {
  description = "Amazon EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Amazon EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_version" {
  description = "Amazon EKS Version"
  value       = module.eks.cluster_version
}

# ===========================================
# ECR
# ===========================================

output "frontend_repository_url" {
  description = "Frontend ECR Repository URL"
  value       = module.ecr.frontend_repository_url
}

output "backend_repository_url" {
  description = "Backend ECR Repository URL"
  value       = module.ecr.backend_repository_url
}

# ===========================================
# ALB
# ===========================================

output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = module.alb.alb_arn
}

# ===========================================
# Route53
# ===========================================

output "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
  value       = module.route53.hosted_zone_id
}

output "domain_name" {
  description = "Application Domain Name"
  value       = module.route53.domain_name
}

# ===========================================
# S3
# ===========================================

output "artifacts_bucket" {
  description = "Artifacts S3 Bucket"
  value       = module.s3.bucket_name
}

# ===========================================
# RDS
# ===========================================

output "database_endpoint" {
  description = "Database Endpoint"
  value       = module.rds.endpoint
}

output "database_port" {
  description = "Database Port"
  value       = module.rds.port
}

# ===========================================
# IAM
# ===========================================

output "eks_node_role_arn" {
  description = "EKS Node IAM Role ARN"
  value       = module.iam.eks_node_role_arn
}

output "eks_cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  value       = module.iam.eks_cluster_role_arn
}

# ===========================================
# Summary
# ===========================================

output "deployment_summary" {
  description = "CloudForge Deployment Summary"

  value = {
    project     = "CloudForge DevOps Platform"
    environment = var.environment
    region      = var.aws_region
    cluster     = module.eks.cluster_name
    domain       = module.route53.domain_name
    load_balancer = module.alb.alb_dns_name
  }
}