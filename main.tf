# generate a random number to have a unique bucket
#bucket name
resource "random_integer" "random" {
  min = 3
  max = 6
}

# Creates a bucket using S3 m o dule
module "s3_bucket" {

  source = "./modules/s3/"

  #bucket_name = "bootcamp30-${random_integer.random.id}-nicole"
  bucket_name = "${var.bootcamp_session}-${random_integer.random.id}-${var.student_name}"

  tags = {
    Environment = local.Environment
    Owner       = local.Owner
  }

}