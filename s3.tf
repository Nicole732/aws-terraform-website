# Enable SSE-KMS Server Side Encryption
resource "aws_kms_key" "backend-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
}

# creates s3 bucket
resource "aws_s3_bucket" "backend-s3" {
  bucket = "bootcamp30-032023-nicole"
}

resource "aws_s3_bucket_acl" "backend-s3-acl" {
  bucket = aws_s3_bucket.backend-s3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "backend-s3-versioning" {
  bucket = aws_s3_bucket.backend-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend-key-config" {
  bucket = aws_s3_bucket.backend-s3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.backend-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
