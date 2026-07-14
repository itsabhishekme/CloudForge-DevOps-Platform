############################################################
# CloudForge DevOps Platform
# Terraform - Route53 Module Variables
############################################################

variable "project_name" {
  description = "Project name used for tagging AWS resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}

############################################################
# Hosted Zone
############################################################

variable "hosted_zone_id" {
  description = "Existing Route53 Hosted Zone ID."
  type        = string
}

variable "domain_name" {
  description = "Primary domain name."
  type        = string
}

############################################################
# DNS Records
############################################################

variable "frontend_subdomain" {
  description = "Frontend subdomain."
  type        = string
  default     = ""
}

variable "backend_subdomain" {
  description = "Backend/API subdomain."
  type        = string
  default     = "api"
}

############################################################
# Load Balancer
############################################################

variable "load_balancer_dns_name" {
  description = "Application Load Balancer DNS name."
  type        = string
}

variable "load_balancer_zone_id" {
  description = "Application Load Balancer Hosted Zone ID."
  type        = string
}

############################################################
# CloudFront (Optional)
############################################################

variable "enable_cloudfront" {
  description = "Create DNS record pointing to CloudFront."
  type        = bool
  default     = false
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name."
  type        = string
  default     = ""
}

variable "cloudfront_hosted_zone_id" {
  description = "CloudFront hosted zone ID."
  type        = string
  default     = "Z2FDTNDATAQYW2"
}

############################################################
# Resource Tags
############################################################

variable "tags" {
  description = "Common resource tags."
  type        = map(string)

  default = {
    Project   = "CloudForge"
    ManagedBy = "Terraform"
  }
}