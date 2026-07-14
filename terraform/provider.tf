#############################################################
# CloudForge DevOps Platform
# Terraform Provider Configuration
#############################################################

terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment and configure for remote state
  # backend "s3" {
  #   bucket         = "cloudforge-terraform-state"
  #   key            = "production/terraform.tfstate"
  #   region         = "ap-south-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-locks"
  # }
}

#############################################################
# AWS Provider
#############################################################

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudForge DevOps Platform"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Abhishek Shrivastava"
    }
  }
}