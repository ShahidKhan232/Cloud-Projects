# Outputs for debugging and reference

output "web_alb_dns" {
  description = "DNS name of the Web Tier ALB"
  value       = aws_lb.web-elb.dns_name
}

output "app_alb_dns" {
  description = "DNS name of the App Tier ALB"
  value       = aws_lb.app-elb.dns_name
}

output "cloudfront_domain" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.cdn-web-elb-distribution.domain_name
}

output "rds_cluster_endpoint" {
  description = "Aurora RDS cluster endpoint"
  value       = aws_rds_cluster.aurora_cluster.endpoint
}

output "web_alb_url" {
  description = "URL to access the Web Tier ALB directly"
  value       = "http://${aws_lb.web-elb.dns_name}"
}

output "app_alb_url" {
  description = "URL to access the App Tier ALB directly (internal)"
  value       = "http://${aws_lb.app-elb.dns_name}:3500"
}
