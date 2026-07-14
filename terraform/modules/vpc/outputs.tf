############################################################
# CloudForge DevOps Platform
# Terraform VPC Module Outputs
############################################################

# ==========================================================
# VPC
# ==========================================================

output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

# ==========================================================
# Internet Gateway
# ==========================================================

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}

# ==========================================================
# Public Subnets
# ==========================================================

output "public_subnet_ids" {
  description = "List of public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "public_subnet_cidr_blocks" {
  description = "CIDR blocks of the public subnets."
  value       = aws_subnet.public[*].cidr_block
}

# ==========================================================
# Private Subnets
# ==========================================================

output "private_subnet_ids" {
  description = "List of private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "private_subnet_cidr_blocks" {
  description = "CIDR blocks of the private subnets."
  value       = aws_subnet.private[*].cidr_block
}

# ==========================================================
# NAT Gateway
# ==========================================================

output "nat_gateway_id" {
  description = "ID of the NAT Gateway."
  value       = aws_nat_gateway.this.id
}

output "elastic_ip_id" {
  description = "Elastic IP allocated for the NAT Gateway."
  value       = aws_eip.nat.id
}

output "elastic_ip_public_ip" {
  description = "Public IP address of the NAT Gateway."
  value       = aws_eip.nat.public_ip
}

# ==========================================================
# Route Tables
# ==========================================================

output "public_route_table_id" {
  description = "Public route table ID."
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "Private route table ID."
  value       = aws_route_table.private.id
}

# ==========================================================
# Availability Zones
# ==========================================================

output "availability_zones" {
  description = "Availability Zones used by the VPC."
  value       = var.availability_zones
}