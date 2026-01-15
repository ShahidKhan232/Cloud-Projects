# VPC
VPC_NAME         = "Two-Tier-VPC"
VPC_CIDR         = "10.0.0.0/16"
IGW_NAME         = "Two-Tier-Interet-Gateway"
PUBLIC_CIDR1     = "10.0.1.0/24"
PUBLIC_SUBNET1   = "Two-Tier-Public-Subnet1"
PUBLIC_CIDR2     = "10.0.2.0/24"
PUBLIC_SUBNET2   = "Two-Tier-Public-Subnet2"
PRIVATE_CIDR1    = "10.0.3.0/24"
PRIVATE_SUBNET1  = "Two-Tier-Private-Subnet1"
PRIVATE_CIDR2    = "10.0.4.0/24"
PRIVATE_SUBNET2  = "Two-Tier-Private-Subnet2"
EIP_NAME1        = "Two-Tier-Elastic-IP1"
EIP_NAME2        = "Two-Tier-Elastic-IP2"
NGW_NAME1        = "Two-Tier-NAT1"
NGW_NAME2        = "Two-Tier-NAT2"
PUBLIC_RT_NAME1  = "Two-Tier-Public-Route-table1"
PUBLIC_RT_NAME2  = "Two-Tier-Public-Route-table2"
PRIVATE_RT_NAME1 = "Two-Tier-Private-Route-table1"
PRIVATE_RT_NAME2 = "Two-Tier-Private-Route-table2"

# SECURITY GROUP
ALB_SG_NAME = "Two-Tier-alb-sg"
WEB_SG_NAME = "Two-Tier-web-sg"
DB_SG_NAME  = "Two-Tier-db-sg"

# RDS
SG_NAME      = "two-tier-rds-sg"
RDS_USERNAME = "admin"
RDS_PWD      = "Admin1234"
DB_NAME      = "mydb"
RDS_NAME     = "Two-Tier-RDS"

# ALB
TG_NAME  = "Web-TG"
ALB_NAME = "Web-elb"

# IAM
IAM_ROLE              = "iam-role-for-ec2-SSM"
IAM_POLICY            = "iam-policy-for-ec2-SSM"
INSTANCE_PROFILE_NAME = "iam-instance-profile-for-ec2-SSM"

# AUTOSCALING
AMI_NAME             = "New-AMI"
LAUNCH_TEMPLATE_NAME = "Web-template"
ASG_NAME             = "Two-Tier-ASG"


# CLOUDFRONT
DOMAIN_NAME = "shahidkhan.tech"
CDN_NAME    = "Two-Tier-CDN"

# WAF
WEB_ACL_NAME = "Two-Tier-WAF"