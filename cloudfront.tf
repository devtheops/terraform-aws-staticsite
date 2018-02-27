resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "Some comment"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.bucket.bucket_domain_name}"
    origin_id   = "myS3Origin"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  depends_on = ["data.aws_acm_certificate.cert", "aws_cloudfront_origin_access_identity.origin_access_identity"]

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.comment}"
  default_root_object = "${var.root_object}"
  aliases             = "${local.cloudfront_aliases}"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "myS3Origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = "${var.min_ttl}"
    default_ttl            = "${var.default_ttl}"
    max_ttl                = "${var.max_ttl}"
  }

  price_class = "${var.price_class}"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = "${merge(var.tags, local.default_tags)}"

  viewer_certificate {
    acm_certificate_arn      = "${data.aws_acm_certificate.cert.arn}"
    ssl_support_method       = "${var.ssl_support_method}"
    minimum_protocol_version = "${var.minimum_protocol_version}"
  }
}
