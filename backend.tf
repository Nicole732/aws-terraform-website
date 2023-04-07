terraform {
    backend "s3" {
        bucket = "terraform-backend-2023"
        key= "s3/module"
        region = "us-east-1"
        #dynamodb_table = "s3_module"
    }
}