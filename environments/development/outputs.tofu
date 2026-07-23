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

output "arn" {
  description = "ARN of the RDS instance."
  value       = module.database.arn
}

output "subnet_group_id" {
  description = "ID of the DB subnet group."
  value       = module.database.subnet_group_id
}

output "engine" {
  description = "Database engine running on the instance."
  value       = module.database.engine
}

output "parameter_group_id" {
  description = "ID of the associated DB parameter group."
  value       = module.database.parameter_group_id
}

output "security_group_id" {
  description = "ID of the associated security group."
  value       = module.database.security_group_id
}

output "security_group_arn" {
  description = "ARN of the associated security group."
  value       = module.database.security_group_arn
}

output "password_secret_arn" {
  description = "ARN of the Secrets Manager secret containing the master user password."
  value       = module.database.password_secret_arn
}

output "cache_id" {
  description = "ID of the ElastiCache instance."
  value       = module.cache.id
}

output "cache_arn" {
  description = "ARN of the ElastiCache instance."
  value       = module.cache.arn
}

output "cache_engine" {
  description = "Engine of the ElastiCache instance."
  value       = module.cache.engine
}

output "cache_security_group_id" {
  description = "ID of the associated security group."
  value       = module.cache.id
}

output "cache_security_group_arn" {
  description = "ARN of the associated security group."
  value       = module.cache.arn
}

output "cache_endpoint" {
  description = "Endpoint of the ElastiCache Serverless cache."
  value       = module.cache.endpoint
}