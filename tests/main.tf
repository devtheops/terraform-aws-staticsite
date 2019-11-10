# Provider
provider "aws" {
  region = "us-east-1"
}

module "static-site" {
  source      = "../"
  name        = "stest"
  host_record = "Z2342342423423"
  domain      = "test.mytestcertdomain.com"
  ssl_cert    = "*.mytestcertdomain.com"

  tags = {
    purpose     = "testing"
    environment = "dev"
  }
}
