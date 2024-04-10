#input variables definition
variable "cidr_block" {
  description = "cidr block for vpc"
  type        = string
}

variable "tags" {
  description = "Tags to set on the vpc."
  type        = map(string)
  default     = {}
}