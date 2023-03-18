# Enable SSE-KMS Server Side Encryption
resource "aws_kms_key" "s3_bucket_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
}

# creates s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name 
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend-key-config" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
