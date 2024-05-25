provider "aws" {
  #define profile with "aws configure --profile landmark" and select it using export AWS_PROFILE=landmark
  profile = "landmark" 
  region  = var.aws_region
}