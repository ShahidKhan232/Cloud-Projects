# 7 Creating Auto Scaling Groups for Web Tier and App Tier for horizontal scaling

# Creating Auto Scaling Group for Web Tier
resource "aws_autoscaling_group" "web-asg" {
  name                      = "Web-ASG"
  vpc_zone_identifier       = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]
  target_group_arns         = [aws_lb_target_group.web-tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  min_size         = 1
  max_size         = 3
  desired_capacity = 1

  launch_template {
    id      = aws_launch_template.Web-LT.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Web-ASG-Instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Tier"
    value               = "Web"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Creating Auto Scaling Group for App Tier
resource "aws_autoscaling_group" "app-asg" {
  name                      = "App-ASG"
  vpc_zone_identifier       = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]
  target_group_arns         = [aws_lb_target_group.app-tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  min_size         = 1
  max_size         = 3
  desired_capacity = 1

  launch_template {
    id      = aws_launch_template.App-LT.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "App-ASG-Instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Tier"
    value               = "App"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Creating Auto Scaling Policies for Web Tier
resource "aws_autoscaling_policy" "web-scale-up" {
  name                   = "Web-Scale-Up-Policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web-asg.name
}

resource "aws_autoscaling_policy" "web-scale-down" {
  name                   = "Web-Scale-Down-Policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web-asg.name
}

# CloudWatch Alarms for Web Tier Auto Scaling
resource "aws_cloudwatch_metric_alarm" "web-cpu-high" {
  alarm_name          = "web-cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This alarm monitors ec2 cpu utilization for Web Tier"
  alarm_actions       = [aws_autoscaling_policy.web-scale-up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web-asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "web-cpu-low" {
  alarm_name          = "web-cpu-utilization-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "This alarm monitors ec2 cpu utilization for Web Tier"
  alarm_actions       = [aws_autoscaling_policy.web-scale-down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web-asg.name
  }
}

# Creating Auto Scaling Policies for App Tier
resource "aws_autoscaling_policy" "app-scale-up" {
  name                   = "App-Scale-Up-Policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.app-asg.name
}

resource "aws_autoscaling_policy" "app-scale-down" {
  name                   = "App-Scale-Down-Policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.app-asg.name
}

# CloudWatch Alarms for App Tier Auto Scaling
resource "aws_cloudwatch_metric_alarm" "app-cpu-high" {
  alarm_name          = "app-cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This alarm monitors ec2 cpu utilization for App Tier"
  alarm_actions       = [aws_autoscaling_policy.app-scale-up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app-asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "app-cpu-low" {
  alarm_name          = "app-cpu-utilization-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "This alarm monitors ec2 cpu utilization for App Tier"
  alarm_actions       = [aws_autoscaling_policy.app-scale-down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app-asg.name
  }
}
