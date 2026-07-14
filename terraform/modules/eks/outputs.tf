############################################################
# CloudForge DevOps Platform
# Terraform - EKS Module Outputs
############################################################

output "cluster_name" {
  description = "Amazon EKS cluster name."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "Amazon EKS cluster ARN."
  value       = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  description = "Amazon EKS API server endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_version" {
  description = "Kubernetes version running on the EKS cluster."
  value       = aws_eks_cluster.this.version
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded cluster certificate authority data."
  value       = aws_eks_cluster.this.certificate_authority[0].data
  sensitive   = true
}

output "cluster_security_group_id" {
  description = "Cluster security group ID."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "oidc_issuer_url" {
  description = "OIDC issuer URL for IAM Roles for Service Accounts (IRSA)."
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "node_group_name" {
  description = "Managed node group name."
  value       = aws_eks_node_group.this.node_group_name
}

output "node_group_arn" {
  description = "Managed node group ARN."
  value       = aws_eks_node_group.this.arn
}

output "node_group_status" {
  description = "Managed node group status."
  value       = aws_eks_node_group.this.status
}

output "node_role_arn" {
  description = "IAM role ARN attached to the worker nodes."
  value       = aws_iam_role.node_role.arn
}

output "cluster_role_arn" {
  description = "IAM role ARN attached to the EKS cluster."
  value       = aws_iam_role.cluster_role.arn
}