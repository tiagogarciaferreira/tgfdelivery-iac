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

output "private_management_subnet_ids" {
  description = "The IDs of the private management subnet."
  value       = [for subnet in aws_subnet.private_management : subnet.id]
}

output "private_management_subnet_arns" {
  description = "The ARNs of the private management subnet."
  value       = [for subnet in aws_subnet.private_management : subnet.arn]
}

output "private_cluster_subnet_ids" {
  description = "The IDs of the private cluster subnet."
  value       = [for subnet in aws_subnet.private_cluster : subnet.id]
}

output "private_cluster_subnet_arns" {
  description = "The ARNs of the private cluster subnet."
  value       = [for subnet in aws_subnet.private_cluster : subnet.arn]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.tgfdelivery_igw.id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway."
  value       = aws_internet_gateway.tgfdelivery_igw.arn
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.tgfdelivery_nat.id
}