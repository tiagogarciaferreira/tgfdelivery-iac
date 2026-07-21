output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "vpc_arn" {
  description = "The ARN of the VPC."
  value       = aws_vpc.main.arn
}

output "public_subnet_ids" {
  description = "The IDs of the public subnet."
  value       = {
    for group_name in keys(var.public_subnets_config) : group_name => [
      for key, subnet in aws_subnet.public : subnet.id
      if local.merged_public_subnets[key].group == group_name
    ]
  }
}

output "public_subnet_arns" {
  description = "The ARNs of the public subnet."
  value       = {
    for group_name in keys(var.public_subnets_config) : group_name => [
      for key, subnet in aws_subnet.public : subnet.arn
      if local.merged_public_subnets[key].group == group_name
    ]
  }
}

output "private_subnet_ids" {
  description = "The IDs of the private subnet."
  value       = {
    for group_name in keys(var.private_subnets_config) : group_name => [
      for key, subnet in aws_subnet.private : subnet.id
      if local.merged_private_subnets[key].group == group_name
    ]
  }
} 

output "private_subnet_arns" {
  description = "The ARNs of the private subnet."
  value       = {
    for group_name in keys(var.private_subnets_config) : group_name => [
      for key, subnet in aws_subnet.private : subnet.arn
      if local.merged_private_subnets[key].group == group_name
    ]
  }
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.main.id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway."
  value       = aws_internet_gateway.main.arn
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.main.id
}

output "route_table_public_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.public.id
}

output "route_table_private_id" {
  description = "The ID of the private route table."
  value       = aws_route_table.private.id
}