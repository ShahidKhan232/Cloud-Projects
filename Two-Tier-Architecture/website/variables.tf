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
# VPC
variable "VPC_NAME" {}
variable "VPC_CIDR" {}
variable "IGW_NAME" {}
variable "PUBLIC_CIDR1" {}
variable "PUBLIC_SUBNET1" {}
variable "PUBLIC_CIDR2" {}
variable "PUBLIC_SUBNET2" {}
variable "PRIVATE_CIDR1" {}
variable "PRIVATE_SUBNET1" {}
variable "PRIVATE_CIDR2" {}
variable "PRIVATE_SUBNET2" {}
variable "EIP_NAME1" {}
variable "EIP_NAME2" {}
variable "NGW_NAME1" {}
variable "NGW_NAME2" {}
variable "PUBLIC_RT_NAME1" {}
variable "PUBLIC_RT_NAME2" {}
variable "PRIVATE_RT_NAME1" {}
variable "PRIVATE_RT_NAME2" {}

# SECURITY GROUP
variable "ALB_SG_NAME" {}
variable "WEB_SG_NAME" {}
variable "DB_SG_NAME" {}

# RDS
variable "SG_NAME" {}
variable "RDS_USERNAME" {}
variable "RDS_PWD" {}
variable "DB_NAME" {}
variable "RDS_NAME" {}



# ALB
variable "TG_NAME" {}
variable "ALB_NAME" {}

# IAM
variable "IAM_ROLE" {}
variable "IAM_POLICY" {}
variable "INSTANCE_PROFILE_NAME" {}

# AUTOSCALING
variable "AMI_NAME" {}
variable "LAUNCH_TEMPLATE_NAME" {}
variable "ASG_NAME" {}

# CLOUDFFRONT
variable "DOMAIN_NAME" {}
variable "CDN_NAME" {}

# WAF
variable "WEB_ACL_NAME" {}
