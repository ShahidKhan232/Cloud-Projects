# 6 Creating Launch Template for Web-Tier with Ubuntu 22.04 AMI
resource "aws_launch_template" "Web-LT" {
  name_prefix   = "Web-LT-"
  image_id      = "ami-0030e4319cbf4dbf2" # Ubuntu 22.04 LTS - us-east-1
  instance_type = "t3.medium"
  key_name      = var.key-name != "" ? var.key-name : null

  iam_instance_profile {
    name = aws_iam_instance_profile.test_profile.name
  }

  vpc_security_group_ids = [aws_security_group.Web-SG.id]

  user_data = base64encode(templatefile("${path.module}/user_data_web.tpl", {
    app_lb_dns = aws_lb.app-elb.dns_name
  }))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Web-Tier-Instance"
      Tier = "Web"
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.app-elb, aws_nat_gateway.ng1, aws_nat_gateway.ng2]
}

# Creating Launch Template for App-Tier with Ubuntu 22.04 AMI
resource "aws_launch_template" "App-LT" {
  name_prefix   = "App-LT-"
  image_id      = "ami-0030e4319cbf4dbf2" # Ubuntu 22.04 LTS - us-east-1
  instance_type = "t3.medium"
  key_name      = var.key-name != "" ? var.key-name : null

  iam_instance_profile {
    name = aws_iam_instance_profile.test_profile.name
  }

  vpc_security_group_ids = [aws_security_group.App-SG.id]

  user_data = base64encode(templatefile("${path.module}/user_data_app.tpl", {
    db_host     = aws_rds_cluster.aurora_cluster.endpoint
    db_name     = var.db-name
    db_user     = var.rds-username
    db_password = var.rds-pwd
  }))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "App-Tier-Instance"
      Tier = "App"
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_rds_cluster.aurora_cluster, aws_nat_gateway.ng1, aws_nat_gateway.ng2]
}
