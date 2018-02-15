# Remote State
terraform {
  backend "s3" {
    bucket = "my-terraform-states"
    key    = "testsite.tfstate"
    region = "us-east-1"
  }
}

# Provider
provider "aws" {
  region = "us-east-1"
}

module "static-site" {
  source      = "github.com/devtheops/terraform-aws-staticsite"
  name        = "stest"
  host_record = "Z2342342423423"
  domain      = "test.mytestcertdomain.com"
  ssl_cert    = "*.mytestcertdomain.com"

  tags = {
    purpose     = "testing"
    environment = "dev"
  }
}
