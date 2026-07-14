############################################################
# CloudForge DevOps Platform
# Terraform Variables
############################################################

############################
# AWS
############################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "cloudforge"
}

variable "environment" {
  description = "Deployment Environment"
  type        = string
  default     = "production"
}

############################
# Networking
############################

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public Subnet CIDRs"
  type        = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnets" {
  description = "Private Subnet CIDRs"
  type        = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

variable "availability_zones" {
  description = "Availability Zones"

  type = list(string)

  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

############################
# EKS
############################

variable "cluster_name" {
  description = "Amazon EKS Cluster Name"
  type        = string
  default     = "cloudforge-cluster"
}

variable "node_instance_type" {
  description = "EKS Worker Node Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "desired_nodes" {
  type    = number
  default = 2
}

variable "min_nodes" {
  type    = number
  default = 2
}

variable "max_nodes" {
  type    = number
  default = 4
}

############################
# EC2
############################

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

############################
# RDS
############################

variable "db_name" {
  type    = string
  default = "cloudforge"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

############################
# S3
############################

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "cloudforge-assets"
}

############################
# Route53
############################

variable "domain_name" {
  description = "Application Domain"
  type        = string
  default     = "cloudforge.example.com"
}

############################
# Tags
############################

variable "tags" {
  description = "Common Resource Tags"

  type = map(string)

  default = {
    Project     = "CloudForge"
    ManagedBy   = "Terraform"
    Environment = "Production"
    Owner       = "Abhishek Shrivastava"
  }
}