# generate a random number to have a unique bucket
#bucket name
resource "random_integer" "random" {
  min = 3
  max = 6
}

# Creates a bucket using S3 m o dule
module "s3_bucket" {
  source = "./modules/s3/"

  bucket_name = local.bucket_name.random_integer.random.id.local.student_name

  tags = {
    Environment = local.Environment
    Owner       = local.Owner
  }

}