provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Additional provider for ACM certificate (must be in us-east-1 for CloudFront)
provider "aws" {
  alias      = "us_east_1"
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}