# ACM Certificate for custom domain (must be in us-east-1 for CloudFront)
resource "aws_acm_certificate" "app_cert" {
  provider          = aws.us_east_1
  domain_name       = var.app_domain_name
  validation_method = "DNS"

  subject_alternative_names = [
    "www.${var.app_domain_name}"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Serverless App Certificate"
  }
}

# Route53 Hosted Zone (assumes you already have a hosted zone, or create new one)
data "aws_route53_zone" "main" {
  name         = var.app_domain_name
  private_zone = false
}

# Route53 records for ACM certificate validation
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.app_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.main.zone_id
}

# ACM Certificate Validation
resource "aws_acm_certificate_validation" "app_cert" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.app_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

# CloudFront Origin Access Identity
resource "aws_cloudfront_origin_access_identity" "amplify_oai" {
  comment = "OAI for Amplify app"
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "amplify_distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Serverless Amplify App CloudFront Distribution"
  default_root_object = "index.html"
  price_class         = "PriceClass_100"

  aliases = [
    var.app_domain_name,
    "www.${var.app_domain_name}"
  ]

  origin {
    domain_name = "${var.app_branch}.${aws_amplify_app.my_amplify_app.default_domain}"
    origin_id   = "AmplifyOrigin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "AmplifyOrigin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.app_cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  depends_on = [
    aws_acm_certificate_validation.app_cert,
    aws_amplify_app.my_amplify_app
  ]

  tags = {
    Name        = "Serverless App CloudFront"
    Environment = "Production"
  }
}

# Import existing Route53 records instead of creating new ones
# Run: terraform import aws_route53_record.root Z08383412AU52B65281F8_shahidkhan.tech._A
# Run: terraform import aws_route53_record.www Z08383412AU52B65281F8_www.shahidkhan.tech._CNAME

# Route53 A record for root domain pointing to CloudFront
resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.app_domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.amplify_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.amplify_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Route53 CNAME record for www subdomain pointing to CloudFront
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.${var.app_domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_cloudfront_distribution.amplify_distribution.domain_name]
}
