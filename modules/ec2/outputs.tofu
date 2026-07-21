output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC."
  value       = module.vpc.vpc_arn
}

output "public_subnet_ids" {
  description = "The IDs of the public subnet."
  value       = module.vpc.public_subnet_ids
}

output "public_subnet_arns" {
  description = "The ARNs of the public subnet."
  value       = module.vpc.public_subnet_arns
}

output "private_management_subnet_ids" {
  description = "The IDs of the private management subnet."
  value       = module.vpc.private_management_subnet_ids
}

output "private_management_subnet_arns" {
  description = "The ARNs of the private management subnet."
  value       = module.vpc.private_management_subnet_arns
}

output "private_cluster_subnet_ids" {
  description = "The IDs of the private cluster subnet."
  value       = module.vpc.private_cluster_subnet_ids
}

output "private_cluster_subnet_arns" {
  description = "The ARNs of the private cluster subnet."
  value       = module.vpc.private_cluster_subnet_arns
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.internet_gateway_id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway."
  value       = module.vpc.internet_gateway_arn
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = module.vpc.nat_gateway_id
}

output "route_table_public_id" {
  description = "The ID of the public route table."
  value       = module.vpc.route_table_public_id
}

output "route_table_private_id" {
  description = "The ID of the private route table."
  value       = module.vpc.route_table_private_id
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
