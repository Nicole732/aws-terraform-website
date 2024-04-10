variable "aws_region" {
  default     = "us-east-1"
  description = "region use to deploy the services"
}

variable "cidr_block" {
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
}
