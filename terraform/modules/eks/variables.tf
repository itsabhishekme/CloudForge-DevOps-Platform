############################################################
# CloudForge DevOps Platform
# Terraform - EKS Module Variables
############################################################

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "cluster_name" {
  description = "Amazon EKS cluster name."
  type        = string
  default     = "cloudforge-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version."
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "VPC ID where the cluster will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for worker nodes."
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for load balancers."
  type        = list(string)
}

variable "node_group_name" {
  description = "Managed node group name."
  type        = string
  default     = "cloudforge-node-group"
}

variable "instance_types" {
  description = "EC2 instance types for worker nodes."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Node capacity type."
  type        = string
  default     = "ON_DEMAND"

  validation {
    condition = contains(
      ["ON_DEMAND", "SPOT"],
      var.capacity_type
    )

    error_message = "capacity_type must be ON_DEMAND or SPOT."
  }
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 4
}

variable "disk_size" {
  description = "Disk size (GB) for worker nodes."
  type        = number
  default     = 30
}

variable "endpoint_private_access" {
  description = "Enable private API endpoint."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Enable public API endpoint."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to EKS resources."
  type        = map(string)
  default     = {}
}