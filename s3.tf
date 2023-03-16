# Enable SSE-KMS Server Side Encryption
resource "aws_kms_key" "backend-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
}

# creates s3 bucket
resource "aws_s3_bucket" "backend-s3" {
  bucket = "bootcamp30-032023-nicole"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.backend-key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

