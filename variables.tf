variable "name" {
  description = "Name to be used on all the resources as identifier."
  default     = ""
}

variable "ssl_cert" {
  description = "The name of the ssl cert to use from ACM."
}

variable "host_record" {
  description = "The Route53 host record to add the dns entry too."
  default     = ""
}

variable "domain" {
  description = "The domain to use for the site. If left out will not create a Route53 record."
  default     = ""
}

variable "extra_cnames" {
  description = "Any other CNAMEs you want added to the cloudfront distrobution."
  default     = []
}

variable "comment" {
  description = "A description of the CloudFront distrobution."
  default     = ""
}

variable "root_object" {
  description = "The root object to load when none specified."
  default     = "index.html"
}

variable "tags" {
  description = "The tags to add to each resource that supports tags."
  default     = {}
}

variable "bucket_name" {
  description = "The name for the bucket. Will default to using a $name-static-assets"
  default     = ""
}

variable "enable_s3_versioning" {
  description = "Enable versioning on the s3 bucket or not."
  default     = false
}

variable "min_ttl" {
  description = "Minimum TTL that can be set on an object."
  default     = 0
}

variable "default_ttl" {
  description = "TTL of an object when one is not set."
  default     = 3600
}

variable "max_ttl" {
  description = "Maximum TTL that can be set on an object"
  default     = 86400
}

variable "price_class" {
  description = "The cloudfront price class to use."
  default     = "PriceClass_100"
}

variable "ssl_support_method" {
  description = "The type of SLL method you want to support."
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "minimum protocol version to require."
  default     = "TLSv1"
}

