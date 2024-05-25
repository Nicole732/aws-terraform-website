#### Step 1 #####
#creates s3 file to store backend 
#can't use s3 module bc variables not allowed in backend configuration

#creates s3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = "backend-state-041024"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true #change to false if need to destroy
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#creates dynamodb 
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "backend_state_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

#####3 Step 2 #### 
#configure the remote backend
#bucket was created in step 1
terraform {
  backend "s3" {
    bucket         = "backend-state-041024"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend_state_locks"
    encrypt        = true

    depends_on = [
      aws_s3_bucket.terraform_state
    ]
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
