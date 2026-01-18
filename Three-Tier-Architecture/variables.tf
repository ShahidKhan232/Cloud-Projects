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

# Data source to get AWS account ID for globally unique bucket naming
data "aws_caller_identity" "current" {}

variable "vpc-name" {
  default = "Three-tier-VPC"
}

variable "ig-name" {
  default = "Three-tier-IG"
}

variable "eip1-name" {
  default = "Nat-IP1"
}

variable "eip2-name" {
  default = "NAT-IP2"
}

variable "public-subnet1" {
  default = "Web-Server1"
}

variable "public-subnet2" {
  default = "Web-Server2"
}

variable "private-subnet1" {
  default = "App-Server1"
}

variable "private-subnet2" {
  default = "App-Server2"
}

variable "private-subnet3" {
  default = "Database-Server1"
}

variable "private-subnet4" {
  default = "Database-Server2"
}

variable "ng1-name" {
  default = "NAT-GW1"
}

variable "ng2-name" {
  default = "NAT-GW2"
}

variable "public-rt1" {
  default = "Public-RT1"
}

variable "public-rt2" {
  default = "Public-RT2"
}

variable "private-rt1" {
  default = "Private-RT1"
}

variable "private-rt2" {
  default = "Private-RT2"
}

variable "private-rt3" {
  default = "Private-RT3"
}

variable "private-rt4" {
  default = "Private-RT4"
}

variable "rds-username" {
  default = "admin"
}

variable "rds-pwd" {
  default = "Shahid1234"
}

variable "key-name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
  default     = ""  # Optional: leave empty if no key pair needed
}

variable "db-name" {
  default = "OnlineShopping"
}

variable "rds-name" {
  default = "Three-Tier-RDS"
}

variable "domain-name" {
  default = "shahidkhan.tech"
}

variable "cdn-name" {
  default = "CDN-Web-ALB-Distribution"
}

variable "web_acl_name" {
  default = "MyWebACL"
}

variable "bucket-name" {
  default = "three-tier-architecture-webapp"
}