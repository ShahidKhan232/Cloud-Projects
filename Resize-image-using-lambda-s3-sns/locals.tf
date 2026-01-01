data "aws_caller_identity" "current" {}

locals {
  account_id                = data.aws_caller_identity.current.account_id
  s3_bucket_lambda_code     = "${var.s3-bucket-lambda-code}-${local.account_id}"
  s3_bucket_dest            = "${var.s3-bucket-dest}-${local.account_id}"
}
