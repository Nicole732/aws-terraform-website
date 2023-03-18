output "bucket-name" {
  description = "Name (id) of the bucket"
  value       = module.s3_bucket.name
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket.arn
}

output "bucket_domain" {
  description = "Domain name of the bucket"
  value       = module.s3_bucket.domain
}

# KMS
output "bucket_key_arn" {
  description = "ARN of the key"
  value       = module.s3_bucket.key-arn
}

output "key-id" {
  description = "Id of the key"
  value       = module.s3_bucket.key-id
}