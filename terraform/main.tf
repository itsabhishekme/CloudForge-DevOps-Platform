##############################################################
# CloudForge DevOps Platform
# Terraform Main Configuration
##############################################################

terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50"
    }
  }
}

##############################################################
# Data Sources
##############################################################

data "aws_availability_zones" "available" {
  state = "available"
}

##############################################################
# VPC
##############################################################

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  availability_zones = data.aws_availability_zones.available.names

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

##############################################################
# IAM
##############################################################

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

##############################################################
# Amazon ECR
##############################################################

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
}

##############################################################
# Amazon EKS
##############################################################

module "eks" {
  source = "./modules/eks"

  project_name = var.project_name

  cluster_name = var.cluster_name

  cluster_version = var.cluster_version

  subnet_ids = module.vpc.private_subnet_ids

  vpc_id = module.vpc.vpc_id

  node_instance_type = var.node_instance_type

  desired_nodes = var.desired_nodes
  min_nodes     = var.min_nodes
  max_nodes     = var.max_nodes
}

##############################################################
# Application Load Balancer
##############################################################

module "alb" {
  source = "./modules/alb"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.public_subnet_ids
}

##############################################################
# Amazon S3
##############################################################

module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
}

##############################################################
# Amazon RDS
##############################################################

module "rds" {
  source = "./modules/rds"

  project_name = var.project_name

  subnet_ids = module.vpc.private_subnet_ids

  vpc_id = module.vpc.vpc_id

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

##############################################################
# Route53
##############################################################

module "route53" {
  source = "./modules/route53"

  project_name = var.project_name

  domain_name = var.domain_name
}