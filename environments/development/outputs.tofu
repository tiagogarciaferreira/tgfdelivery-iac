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
  value       = module.vpc.public_subnet_ids["public"]
}

output "public_subnet_arns" {
  description = "The ARNs of the public subnet."
  value       = module.vpc.public_subnet_arns["public"]
}

output "private_management_subnet_ids" {
  description = "The IDs of the private management subnet."
  value       = module.vpc.private_subnet_ids["management"]
}

output "private_management_subnet_arns" {
  description = "The ARNs of the private management subnet."
  value       = module.vpc.private_subnet_arns["management"]
}

output "private_cluster_subnet_ids" {
  description = "The IDs of the private cluster subnet."
  value       = module.vpc.private_subnet_ids["cluster"]
}

output "private_cluster_subnet_arns" {
  description = "The ARNs of the private cluster subnet."
  value       = module.vpc.private_subnet_arns["cluster"]
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

output "bastion_instance_id" {
  description = "The ID of the bastion EC2 instance."
  value       = module.bastion.id
}

output "bastion_instance_arn" {
  description = "The ARN of the bastion EC2 instance."
  value       = module.bastion.arn
}

output "bastion_instance_public_ip" {
  description = "The public IP of the bastion EC2 instance."
  value       = module.bastion.public_ip
}

output "security_group_bastion_id" {
  description = "The ID of the bastion security group."
  value       = module.bastion.security_group_id
}

output "keypair_arn" {
  description = "The ARN of the key pair."
  value       = module.bastion.keypair_arn
}