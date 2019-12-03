variable "name" {
  description = "Name to be used on all the resources as identifier."
  type        = string
  default     = ""
}

variable "ssl_cert" {
  description = "The name of the ssl cert to use from ACM."
  type        = string
}

variable "host_record" {
  description = "The Route53 host record to add the dns entry too."
  type        = string
  default     = ""
}

variable "domain" {
  description = "The domain to use for the site. If left out will not create a Route53 record."
  type        = string
  default     = ""
}

variable "extra_cnames" {
  description = "Any other CNAMEs you want added to the cloudfront distrobution."
  type        = list(string)
  default     = []
}

variable "comment" {
  description = "A description of the CloudFront distrobution."
  type        = string
  default     = ""
}

variable "root_object" {
  description = "The root object to load when none specified."
  type        = string
  default     = "index.html"
}

variable "tags" {
  description = "The tags to add to each resource that supports tags."
  type        = map
  default     = {}
}

variable "bucket_name" {
  description = "The name for the bucket. Will default to using a $name-static-assets"
  type        = string
  default     = ""
}

variable "enable_s3_versioning" {
  description = "Enable versioning on the s3 bucket or not."
  type        = bool
  default     = false
}

variable "lambda_function_associations" {
  description = "This will enable a lambda@edge to tell cloudfront to us the lambda for every request. Extra charges may apply."
  type = list(object({
    event_type   = string
    lambda_arn   = string
    include_body = bool
  }))
  default = []
}

variable "min_ttl" {
  description = "Minimum TTL that can be set on an object."
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "TTL of an object when one is not set."
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "Maximum TTL that can be set on an object"
  type        = number
  default     = 86400
}

variable "price_class" {
  description = "The cloudfront price class to use."
  type        = string
  default     = "PriceClass_100"
}

variable "ssl_support_method" {
  description = "The type of SLL method you want to support."
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "minimum protocol version to require."
  type        = string
  default     = "TLSv1"
}

variable "depends_hack" {
  default = []
}
