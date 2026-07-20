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
  value       = [for subnet in aws_subnet.tgfdelivery_public : subnet.id]
}

output "public_subnet_arns" {
  description = "The ARNs of the public subnet."
  value       = [for subnet in aws_subnet.tgfdelivery_public : subnet.arn]
}

output "private_management_subnet_ids" {
  description = "The IDs of the private management subnet."
  value       = [for subnet in aws_subnet.tgfdelivery_private_management : subnet.id]
}

output "private_management_subnet_arns" {
  description = "The ARNs of the private management subnet."
  value       = [for subnet in aws_subnet.tgfdelivery_private_management : subnet.arn]
}

output "private_cluster_subnet_ids" {
  description = "The IDs of the private cluster subnet."
  value       = [for subnet in aws_subnet.tgfdelivery_private_cluster : subnet.id]
}

output "private_cluster_subnet_arns" {
  description = "The ARNs of the private cluster subnet."
  value       = [for subnet in aws_subnet.tgfdelivery_private_cluster : subnet.arn]
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

output "route_table_public_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.tgfdelivery_public.id
}

output "route_table_private_id" {
  description = "The ID of the private route table."
  value       = aws_route_table.tgfdelivery_private.id
}

