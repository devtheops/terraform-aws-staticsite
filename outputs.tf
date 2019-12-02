output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}

output "cloudfront_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

