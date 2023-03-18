
module "s3_bucket" {
    source = "./modules/s3/"
    
    bucket_name = "bootcamp30-032023-nicole"

    tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}