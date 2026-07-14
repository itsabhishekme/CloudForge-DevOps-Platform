############################################################
# CloudForge DevOps Platform
# Terraform - RDS Module Outputs
############################################################

output "db_instance_id" {
  description = "RDS instance ID."
  value       = aws_db_instance.this.id
}

output "db_instance_arn" {
  description = "RDS instance ARN."
  value       = aws_db_instance.this.arn
}

output "db_instance_endpoint" {
  description = "RDS endpoint."
  value       = aws_db_instance.this.endpoint
}

output "db_instance_address" {
  description = "RDS hostname."
  value       = aws_db_instance.this.address
}

output "db_instance_port" {
  description = "RDS port."
  value       = aws_db_instance.this.port
}

output "db_instance_name" {
  description = "Database name."
  value       = aws_db_instance.this.db_name
}

output "db_instance_username" {
  description = "Master username."
  value       = aws_db_instance.this.username
  sensitive   = true
}

output "db_instance_engine" {
  description = "Database engine."
  value       = aws_db_instance.this.engine
}

output "db_instance_engine_version" {
  description = "Database engine version."
  value       = aws_db_instance.this.engine_version
}

output "db_instance_status" {
  description = "Current RDS status."
  value       = aws_db_instance.this.status
}

output "db_instance_resource_id" {
  description = "RDS resource ID."
  value       = aws_db_instance.this.resource_id
}

output "db_security_group_id" {
  description = "Security Group attached to RDS."
  value       = aws_security_group.rds.id
}

output "db_subnet_group_name" {
  description = "RDS DB subnet group."
  value       = aws_db_subnet_group.this.name
}