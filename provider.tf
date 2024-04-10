provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = var.aws_region
}