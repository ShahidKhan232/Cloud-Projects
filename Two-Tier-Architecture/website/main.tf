module "vpc" {
  source = "../modules/aws-vpc"

  vpc-name        = var.VPC_NAME
  vpc-cidr        = var.VPC_CIDR
  igw-name        = var.IGW_NAME
  public-cidr1    = var.PUBLIC_CIDR1
  public-subnet1  = var.PUBLIC_SUBNET1
  public-cidr2    = var.PUBLIC_CIDR2
  public-subnet2  = var.PUBLIC_SUBNET2
  private-cidr1   = var.PRIVATE_CIDR1
  private-subnet1 = var.PRIVATE_SUBNET1
  private-cidr2   = var.PRIVATE_CIDR2
  private-subnet2 = var.PRIVATE_SUBNET2
  eip-name1       = var.EIP_NAME1
  eip-name2       = var.EIP_NAME2

  ngw-name1        = var.NGW_NAME1
  ngw-name2        = var.NGW_NAME2
  public-rt-name1  = var.PUBLIC_RT_NAME1
  public-rt-name2  = var.PUBLIC_RT_NAME2
  private-rt-name1 = var.PRIVATE_RT_NAME1
  private-rt-name2 = var.PRIVATE_RT_NAME2
}

module "security-group" {
  source = "../modules/security-group"

  vpc-name    = var.VPC_NAME
  alb-sg-name = var.ALB_SG_NAME
  web-sg-name = var.WEB_SG_NAME
  db-sg-name  = var.DB_SG_NAME

  depends_on = [module.vpc]
}

module "rds" {
  source = "../modules/aws-rds"

  sg-name              = var.SG_NAME
  vpc-name             = var.VPC_NAME
  private-subnet-name1 = var.PRIVATE_SUBNET1
  private-subnet-name2 = var.PRIVATE_SUBNET2
  db-sg-id             = module.security-group.db_sg_id
  rds-username         = var.RDS_USERNAME
  rds-pwd              = var.RDS_PWD
  db-name              = var.DB_NAME
  rds-name             = var.RDS_NAME

  depends_on = [module.security-group]
}

module "alb" {
  source = "../modules/alb-tg"

  public-subnet-name1 = var.PUBLIC_SUBNET1
  public-subnet-name2 = var.PUBLIC_SUBNET2
  alb-sg-id           = module.security-group.alb_sg_id
  alb-name            = var.ALB_NAME
  tg-name             = var.TG_NAME
  vpc-name            = var.VPC_NAME

  depends_on = [module.rds]
}

module "iam" {
  source = "../modules/aws-iam"

  iam-role              = var.IAM_ROLE
  iam-policy            = var.IAM_POLICY
  instance-profile-name = var.INSTANCE_PROFILE_NAME

  depends_on = [module.alb]
}

module "autoscaling" {
  source = "../modules/aws-autoscaling"

  ami_name              = var.AMI_NAME
  launch-template-name  = var.LAUNCH_TEMPLATE_NAME
  instance-profile-arn  = module.iam.instance_profile_arn
  web-sg-id             = module.security-group.web_sg_id
  tg-arn                = module.alb.target_group_arn
  iam-role              = var.IAM_ROLE
  public-subnet-name1   = var.PUBLIC_SUBNET1
  public-subnet-name2   = var.PUBLIC_SUBNET2
  asg-name              = var.ASG_NAME

  depends_on = [module.iam]
}

module "route53" {
  source = "../modules/aws-waf-cdn-acm-route53"

  domain-name  = var.DOMAIN_NAME
  cdn-name     = var.CDN_NAME
  alb-name     = var.ALB_NAME
  web_acl_name = var.WEB_ACL_NAME

  depends_on = [ module.autoscaling ]
}