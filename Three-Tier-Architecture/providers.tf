

# Provider alias for us-east-1 (required for ACM certificates used with CloudFront)
provider "aws" {
  alias      = "use_default_region"
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}