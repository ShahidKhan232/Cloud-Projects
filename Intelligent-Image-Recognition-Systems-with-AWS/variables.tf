variable "s3-bucket-lambda-code" {
  default = "image-rekognition-bucket-20251231"
  type    = string
}
variable "lambda-function-name" {
  default = "Image-Rekognition-Lambda"
  type    = string
}
variable "sns-name" {
  default = "image-rekognition-SNS-Topic"
  type    = string
}
variable "mail-id" {
  default = "shahidkhan.95173@gmail.com"
  type    = string
}

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