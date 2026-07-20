output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.tgfdelivery_vpc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC."
  value       = aws_vpc.tgfdelivery_vpc.arn
}

output "public_subnet_ids" {
  description = "The IDs of the public subnet."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "public_subnet_arns" {
  description = "The ARNs of the public subnet."
  value       = [for subnet in aws_subnet.public : subnet.arn]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.tgfdelivery_igw.id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway."
  value       = aws_internet_gateway.tgfdelivery_igw.arn
}