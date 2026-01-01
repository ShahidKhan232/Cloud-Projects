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

variable "s3-bucket-lambda-code" {
  default = "non-resized-image"
  type    = string
}

variable "s3-bucket-dest" {
  default = "resized-images"
  type    = string
}

variable "sns-name" {
  default = "Resized-Image-SNS-Topic"
  type    = string
}

variable "mail-id" {
  default = "shahidkhan.95173@gmail.com"
  type    = string
}