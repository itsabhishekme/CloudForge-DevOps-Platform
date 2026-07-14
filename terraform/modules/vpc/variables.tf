############################################################
# CloudForge DevOps Platform
# Terraform - VPC Module Variables
############################################################

variable "project_name" {
  description = "Project name used to prefix AWS resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}

############################################################
# AWS Region
############################################################

variable "aws_region" {
  description = "AWS region."
  type        = string
  default     = "ap-south-1"
}

############################################################
# VPC
############################################################

variable "vpc_name" {
  description = "VPC name."
  type        = string
  default     = "cloudforge-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

############################################################
# Availability Zones
############################################################

variable "availability_zones" {
  description = "Availability zones."
  type        = list(string)

  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

############################################################
# Public Subnets
############################################################

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."

  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

############################################################
# Private Subnets
############################################################

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."

  type = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

############################################################
# NAT Gateway
############################################################

variable "enable_nat_gateway" {
  description = "Create a NAT Gateway."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway."
  type        = bool
  default     = true
}

############################################################
# DNS
############################################################

variable "enable_dns_support" {
  description = "Enable DNS support."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames."
  type        = bool
  default     = true
}

############################################################
# Tags
############################################################

variable "tags" {
  description = "Common resource tags."

  type = map(string)

  default = {
    Project     = "CloudForge DevOps Platform"
    ManagedBy   = "Terraform"
    Environment = "Development"
  }
}