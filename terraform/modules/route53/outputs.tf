############################################################
# CloudForge DevOps Platform
# Terraform - Route 53 Module Outputs
############################################################

output "hosted_zone_id" {
  description = "ID of the Route 53 hosted zone."
  value       = aws_route53_zone.this.zone_id
}

output "hosted_zone_name" {
  description = "Domain name of the hosted zone."
  value       = aws_route53_zone.this.name
}

output "hosted_zone_arn" {
  description = "ARN of the hosted zone."
  value       = aws_route53_zone.this.arn
}

output "name_servers" {
  description = "Authoritative name servers for the hosted zone."
  value       = aws_route53_zone.this.name_servers
}

output "frontend_fqdn" {
  description = "Frontend fully qualified domain name."
  value       = aws_route53_record.frontend.fqdn
}

output "backend_fqdn" {
  description = "Backend API fully qualified domain name."
  value       = aws_route53_record.backend.fqdn
}

output "frontend_record_name" {
  description = "Frontend DNS record name."
  value       = aws_route53_record.frontend.name
}

output "backend_record_name" {
  description = "Backend DNS record name."
  value       = aws_route53_record.backend.name
}