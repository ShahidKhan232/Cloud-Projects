output "alb_dns_name" {
  value = aws_lb.web-alb.dns_name
}

output "alb_arn" {
  value = aws_lb.web-alb.arn
}

output "alb_zone_id" {
  value = aws_lb.web-alb.zone_id
}

output "target_group_arn" {
  value = aws_lb_target_group.web-tg.arn
}
