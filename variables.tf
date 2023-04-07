variable "aws_region" {
  default     = "us-east-1"
  description = "region use to deploy the services"
}

variable "bootcamp_session" {
  type        = string
  description = "bootcamp session"
}

variable "student_name" {
  type        = string
  description = "Student name"
}