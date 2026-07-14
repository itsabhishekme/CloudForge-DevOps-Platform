############################################################
# CloudForge DevOps Platform
# Terraform - IAM Module Outputs
############################################################

# ==========================================================
# EKS Cluster Role
# ==========================================================

output "eks_cluster_role_name" {
  description = "Name of the EKS Cluster IAM Role."
  value       = aws_iam_role.eks_cluster.name
}

output "eks_cluster_role_arn" {
  description = "ARN of the EKS Cluster IAM Role."
  value       = aws_iam_role.eks_cluster.arn
}

# ==========================================================
# EKS Node Group Role
# ==========================================================

output "eks_node_role_name" {
  description = "Name of the EKS Node Group IAM Role."
  value       = aws_iam_role.eks_node.name
}

output "eks_node_role_arn" {
  description = "ARN of the EKS Node Group IAM Role."
  value       = aws_iam_role.eks_node.arn
}

# ==========================================================
# ECR Access Role
# ==========================================================

output "ecr_role_name" {
  description = "Name of the ECR IAM Role."
  value       = aws_iam_role.ecr.name
}

output "ecr_role_arn" {
  description = "ARN of the ECR IAM Role."
  value       = aws_iam_role.ecr.arn
}

# ==========================================================
# Jenkins Role
# ==========================================================

output "jenkins_role_name" {
  description = "Name of the Jenkins IAM Role."
  value       = aws_iam_role.jenkins.name
}

output "jenkins_role_arn" {
  description = "ARN of the Jenkins IAM Role."
  value       = aws_iam_role.jenkins.arn
}

# ==========================================================
# GitHub Actions Role
# ==========================================================

output "github_actions_role_name" {
  description = "Name of the GitHub Actions IAM Role."
  value       = aws_iam_role.github_actions.name
}

output "github_actions_role_arn" {
  description = "ARN of the GitHub Actions IAM Role."
  value       = aws_iam_role.github_actions.arn
}