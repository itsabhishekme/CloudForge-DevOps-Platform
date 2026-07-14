############################################################
# CloudForge DevOps Platform
# Terraform Module - Amazon S3
############################################################

resource "aws_s3_bucket" "cloudforge" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = merge(
    {
      Name        = var.bucket_name
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

############################################################
# Versioning
############################################################

resource "aws_s3_bucket_versioning" "cloudforge" {
  bucket = aws_s3_bucket.cloudforge.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

############################################################
# Server Side Encryption
############################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudforge" {
  bucket = aws_s3_bucket.cloudforge.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

    bucket_key_enabled = true
  }
}

############################################################
# Public Access Block
############################################################

resource "aws_s3_bucket_public_access_block" "cloudforge" {
  bucket = aws_s3_bucket.cloudforge.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

############################################################
# Ownership Controls
############################################################

resource "aws_s3_bucket_ownership_controls" "cloudforge" {
  bucket = aws_s3_bucket.cloudforge.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

############################################################
# Lifecycle Configuration
############################################################

resource "aws_s3_bucket_lifecycle_configuration" "cloudforge" {
  bucket = aws_s3_bucket.cloudforge.id

  rule {
    id     = "cloudforge-lifecycle"
    status = "Enabled"

    filter {}

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}