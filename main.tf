terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature
}

locals {
  default_tags = {
    terraform = "true"
  }

  bucket_name        = "${length(var.bucket_name) > 0 ? var.bucket_name : format("%v-static-assets", var.name)}"
  cloudfront_aliases = ["${split(",", length(var.domain) > 0 ? join(",", concat(list(var.domain), var.extra_cnames)) : join(",", var.extra_cnames))}"]
}

data "aws_acm_certificate" "cert" {
  domain   = "${var.ssl_cert}"
  statuses = ["ISSUED"]
}
