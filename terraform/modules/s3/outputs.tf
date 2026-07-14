############################################################
# CloudForge DevOps Platform
# Terraform - S3 Module Outputs
############################################################

# ==========================================================
# Bucket Information
# ==========================================================

output "bucket_id" {
  description = "ID of the S3 bucket."
  value       = aws_s3_bucket.this.id
}

output "bucket_name" {
  description = "Name of the S3 bucket."
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket."
  value       = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  description = "Bucket domain name."
  value       = aws_s3_bucket.this.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the bucket."
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

# ==========================================================
# Website Hosting
# ==========================================================

output "website_endpoint" {
  description = "Static website endpoint."
  value = try(
    aws_s3_bucket_website_configuration.this.website_endpoint,
    null
  )
}

output "website_domain" {
  description = "Static website domain."
  value = try(
    aws_s3_bucket_website_configuration.this.website_domain,
    null
  )
}

# ==========================================================
# Versioning
# ==========================================================

output "versioning_status" {
  description = "S3 bucket versioning status."
  value = try(
    aws_s3_bucket_versioning.this.versioning_configuration[0].status,
    null
  )
}

# ==========================================================
# Encryption
# ==========================================================

output "encryption_algorithm" {
  description = "Server-side encryption algorithm."
  value = try(
    aws_s3_bucket_server_side_encryption_configuration.this.rule[0].apply_server_side_encryption_by_default[0].sse_algorithm,
    null
  )
}