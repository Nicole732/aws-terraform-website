terraform {
  backend "s3" {
    bucket         = "terraform-backend-2023"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

resource "aws_dynamodb_table" "tf-lock" {
  name           = "terraform-lock"
  hash_key       = "LockId"
  read_capacity  = 3
  write_capacity = 3

  attribute {
    name = "LockId"
    type = "S"
  }
  tags = {
    name = "Terraform lock Table"
  }
  lifecycle {
    prevent_destroy = true
  }
}

