#generates a random number; buckets names are unique
resource "random_integer" "random" {
  min = 6
  max = 10
}

# creates s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  #bucket_prefix = "bt-${random_integer.random.id}"
  bucket = "${var.bucket_name}-${random_integer.random.id}"
}

resource "aws_s3_bucket_ownership_controls" "bucket_owner" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_owner]
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

# Enable SSE-KMS Server Side Encryption
resource "aws_kms_key" "s3_bucket_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
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