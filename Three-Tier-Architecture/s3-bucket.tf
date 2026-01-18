# 13 Creating S3 bucket for application storage and backups
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.bucket-name}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name = "Three-Tier-Application-Bucket"
  }
}

# Block all public access to S3 bucket for security
resource "aws_s3_bucket_public_access_block" "public-access-block" {
  bucket = aws_s3_bucket.s3-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning for data protection
resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.s3-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-encryption" {
  bucket = aws_s3_bucket.s3-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}