############################################################
# CloudForge DevOps Platform
# Terraform - S3 Module Variables
############################################################

variable "project_name" {
  description = "Project name used for naming S3 buckets."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}

variable "bucket_name" {
  description = "Primary S3 bucket name."
  type        = string
}

variable "enable_versioning" {
  description = "Enable object versioning."
  type        = bool
  default     = true
}

variable "enable_encryption" {
  description = "Enable server-side encryption."
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "Optional KMS Key ID for SSE-KMS encryption."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Delete bucket even if it contains objects."
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Block all forms of public access."
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Enable S3 access logging."
  type        = bool
  default     = false
}

variable "logging_bucket" {
  description = "Destination bucket for server access logs."
  type        = string
  default     = ""
}

variable "logging_prefix" {
  description = "Prefix used for access logs."
  type        = string
  default     = "logs/"
}

variable "cors_rules" {
  description = "CORS configuration for the bucket."
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = []
}

variable "lifecycle_rules_enabled" {
  description = "Enable lifecycle management rules."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to S3 resources."
  type        = map(string)
  default     = {}
}