resource "aws_route53_record" "record" {
  count   = length(var.domain) > 0 ? 1 : 0
  zone_id = var.host_record
  name    = var.domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

