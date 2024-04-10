#VPC
output "arn" {
    description ="ARN of the VPC"
    value = aws_vpc.vpc.arn
}

output "id" {
    description = "value of the ID of the VPC"
    value = aws_vpc.vpc.id
}