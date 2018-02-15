## terraform-aws-staticsite

The Terraform module creates everything needed to make a static website.

It will create the following resources:

- S3 Bucket
- Cloudfront distrobution and point it to the bucket
- Policies to grant the distrobution access to the bucket
- Route53 Record pointing to the distrobution (optional)
