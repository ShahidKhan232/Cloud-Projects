resource "aws_s3_bucket" "lambda_code_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Lambda Code Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "lambda_code_bucket_versioning" {
  bucket = aws_s3_bucket.lambda_code_bucket.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "lambda_code_bucket_encryption" {
  bucket = aws_s3_bucket.lambda_code_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Note: Lambda function code (GET.zip and POST.zip) must be uploaded to this bucket
# before running terraform apply. You can upload manually via AWS Console or AWS CLI:
# aws s3 cp GET.zip s3://${var.bucket_name}/GET.zip
# aws s3 cp POST.zip s3://${var.bucket_name}/POST.zip
