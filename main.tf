# Creates a bucket using S3 module
module "s3_bucket" {
  source = "./modules/s3/"

  bucket_name = "mys3bucket"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}