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

output "security_group_bastion_id" {
  description = "The ID of the bastion security group."
  value       = aws_security_group.tgfdelivery_bastion.id
}

output "security_group_private_vm_id" {
  description = "The ID of the private VM security group."
  value       = aws_security_group.tgfdelivery_private_vm.id
}

output "bastion_instance_id" {
  description = "The ID of the bastion EC2 instance."
  value       = aws_instance.tgfdelivery_bastion.id
}

output "bastion_instance_arn" {
  description = "The ARN of the bastion EC2 instance."
  value       = aws_instance.tgfdelivery_bastion.arn
}

output "bastion_instance_public_ip" {
  description = "The public IP of the bastion EC2 instance."
  value       = aws_instance.tgfdelivery_bastion.public_ip
}

output "private_vm_instance_id" {
  description = "The ID of the private VM EC2 instance."
  value       = aws_instance.tgfdelivery_private_vm.id
}

output "private_vm_instance_arn" {
  description = "The ARN of the private VM EC2 instance."
  value       = aws_instance.tgfdelivery_private_vm.arn
}

output "private_vm_instance_private_ip" {
  description = "The private IP of the private VM EC2 instance."
  value       = aws_instance.tgfdelivery_private_vm.private_ip
}
