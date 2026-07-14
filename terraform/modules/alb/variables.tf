# ==========================================================
# CloudForge DevOps Platform
# Terraform Module - Application Load Balancer Variables
# ==========================================================

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups attached to the ALB"
  type        = list(string)
}

variable "target_port" {
  description = "Application target port"
  type        = number
  default     = 3000
}

variable "health_check_path" {
  description = "Health check endpoint"
  type        = string
  default     = "/"
}

variable "certificate_arn" {
  description = "AWS ACM Certificate ARN (optional)"
  type        = string
  default     = ""
}

variable "enable_https" {
  description = "Enable HTTPS listener"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common AWS resource tags"
  type        = map(string)
  default     = {}
}