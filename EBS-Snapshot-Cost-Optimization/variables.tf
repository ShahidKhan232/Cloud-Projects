variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}
variable "lambda-function-name" {
  default = "EBS-Snapshot-Cost-Optimization-lambda"
}