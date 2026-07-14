# ==========================================================
# CloudForge DevOps Platform
# Terraform ALB Module Outputs
# ==========================================================

output "alb_id" {
  description = "Application Load Balancer ID"
  value       = aws_lb.this.id
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.this.arn
}

output "alb_name" {
  description = "Application Load Balancer Name"
  value       = aws_lb.this.name
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "Application Load Balancer Hosted Zone ID"
  value       = aws_lb.this.zone_id
}

output "alb_security_group_id" {
  description = "Security Group attached to the ALB"
  value       = aws_security_group.alb.id
}

output "http_listener_arn" {
  description = "HTTP Listener ARN"
  value       = aws_lb_listener.http.arn
}

output "https_listener_arn" {
  description = "HTTPS Listener ARN"
  value       = try(aws_lb_listener.https.arn, null)
}

output "frontend_target_group_arn" {
  description = "Frontend Target Group ARN"
  value       = aws_lb_target_group.frontend.arn
}

output "backend_target_group_arn" {
  description = "Backend Target Group ARN"
  value       = aws_lb_target_group.backend.arn
}

output "frontend_target_group_name" {
  description = "Frontend Target Group Name"
  value       = aws_lb_target_group.frontend.name
}

output "backend_target_group_name" {
  description = "Backend Target Group Name"
  value       = aws_lb_target_group.backend.name
}