# Output variable definitions
# s3
output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
}

# KMS
output "key-arn" {
  description = "ARN of the key"
  value       = aws_kms_key.s3_bucket_key.arn
}

output "key-id" {
  description = "Id of the key"
  value       = aws_kms_key.s3_bucket_key.id
}
