# ==========================================================
# CloudForge DevOps Platform
# Terraform ECR Module Outputs
# ==========================================================

# ----------------------------------------------------------
# Frontend Repository
# ----------------------------------------------------------

output "frontend_repository_name" {
  description = "Frontend ECR repository name"
  value       = aws_ecr_repository.frontend.name
}

output "frontend_repository_arn" {
  description = "Frontend ECR repository ARN"
  value       = aws_ecr_repository.frontend.arn
}

output "frontend_repository_url" {
  description = "Frontend ECR repository URL"
  value       = aws_ecr_repository.frontend.repository_url
}

# ----------------------------------------------------------
# Backend Repository
# ----------------------------------------------------------

output "backend_repository_name" {
  description = "Backend ECR repository name"
  value       = aws_ecr_repository.backend.name
}

output "backend_repository_arn" {
  description = "Backend ECR repository ARN"
  value       = aws_ecr_repository.backend.arn
}

output "backend_repository_url" {
  description = "Backend ECR repository URL"
  value       = aws_ecr_repository.backend.repository_url
}

# ----------------------------------------------------------
# Repository URLs
# ----------------------------------------------------------

output "repository_urls" {
  description = "Map of application repository URLs"

  value = {
    frontend = aws_ecr_repository.frontend.repository_url
    backend  = aws_ecr_repository.backend.repository_url
  }
}

# ----------------------------------------------------------
# Repository ARNs
# ----------------------------------------------------------

output "repository_arns" {
  description = "Map of application repository ARNs"

  value = {
    frontend = aws_ecr_repository.frontend.arn
    backend  = aws_ecr_repository.backend.arn
  }
}