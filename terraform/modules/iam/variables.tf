############################################################
# CloudForge DevOps Platform
# Terraform - IAM Module Variables
############################################################

variable "project_name" {
  description = "Project name used as a prefix for IAM resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}

variable "create_eks_role" {
  description = "Whether to create the Amazon EKS cluster IAM role."
  type        = bool
  default     = true
}

variable "create_node_group_role" {
  description = "Whether to create the Amazon EKS node group IAM role."
  type        = bool
  default     = true
}

variable "create_ec2_role" {
  description = "Whether to create an EC2 IAM role."
  type        = bool
  default     = true
}

variable "eks_cluster_role_name" {
  description = "IAM role name for the Amazon EKS cluster."
  type        = string
  default     = "cloudforge-eks-cluster-role"
}

variable "eks_node_role_name" {
  description = "IAM role name for the Amazon EKS managed node group."
  type        = string
  default     = "cloudforge-eks-node-role"
}

variable "ec2_role_name" {
  description = "IAM role name for EC2 instances."
  type        = string
  default     = "cloudforge-ec2-role"
}

variable "tags" {
  description = "Common tags applied to IAM resources."
  type        = map(string)
  default     = {}
}