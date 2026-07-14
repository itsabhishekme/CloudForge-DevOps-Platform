############################################################
# CloudForge DevOps Platform
# Terraform - ECR Module Variables
############################################################

variable "project_name" {
  description = "Project name used as a prefix for ECR repositories."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}

variable "frontend_repository_name" {
  description = "Frontend ECR repository name."
  type        = string
  default     = "cloudforge-frontend"
}

variable "backend_repository_name" {
  description = "Backend ECR repository name."
  type        = string
  default     = "cloudforge-backend"
}

variable "image_tag_mutability" {
  description = "Image tag mutability for ECR repositories."
  type        = string
  default     = "MUTABLE"

  validation {
    condition = contains(
      ["MUTABLE", "IMMUTABLE"],
      var.image_tag_mutability
    )
    error_message = "image_tag_mutability must be either MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Enable image vulnerability scanning on push."
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "Allow Terraform to delete repositories containing images."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags applied to ECR resources."
  type        = map(string)
  default     = {}
}