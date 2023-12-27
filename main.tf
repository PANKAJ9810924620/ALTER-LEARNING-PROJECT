provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "chron-terraform-backend"
    key    = "main.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}

resource "aws_s3_bucket" "main" {
  bucket = "startup-chronicles-demo-account"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
