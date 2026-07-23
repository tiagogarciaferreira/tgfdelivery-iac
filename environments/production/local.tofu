locals {
  context_name                  = "tgfdelivery"
  nat_gateway_availability_mode = var.nat_gw_availability_mode ? "regional" : "zonal"
  managed_by                    = "OpenTofu"
  internet_cidr_block           = "0.0.0.0/0"
  my_public_ip                  = "${trimspace(data.http.my_public_ip.response_body)}/32"
  short_environment             = "prod"

  common_tags = {
    Environment       = var.environment
    Short-Environment = local.short_environment
    ManagedBy         = local.managed_by
    Project           = local.context_name
  }

  bastion_security_group_config = {
    name        = "${local.context_name}-${var.environment}-bastion-sg"
    description = "Configuring security groups for EC2 instances."

    ingress_rules = try(length(var.bastion_security_group_config.ingress_rules), 0) > 0 ? (
    var.bastion_security_group_config.ingress_rules) : [
      {
        description = "Allow SSH access from administrator IP"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [local.my_public_ip]
      }
    ]
    egress_rules = try(length(var.bastion_security_group_config.egress_rules), 0) > 0 ? (
    var.bastion_security_group_config.egress_rules) : [
      {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [local.internet_cidr_block]
      }
    ]
  }

  db_security_group_config = {
    name        = "${local.context_name}-${var.environment}-database-sg"
    description = "Configuring security groups for DB instances."

    ingress_rules = try(length(var.db_security_group_config.ingress_rules), 0) > 0 ? (
    var.db_security_group_config.ingress_rules) : [
      {
        description = "Allow inbound database traffic from the VPC"
        from_port   = var.db_port
        to_port     = var.db_port
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
      }
    ]
    egress_rules = try(length(var.db_security_group_config.egress_rules), 0) > 0 ? (
    var.db_security_group_config.egress_rules) : [
      {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [local.internet_cidr_block]
      }
    ]
  }

  cache_security_group_config = {
    name        = "${local.context_name}-${var.environment}-cache-sg"
    description = "Configuring security groups for ElastiCache."

    ingress_rules = try(length(var.cache_security_group_config.ingress_rules), 0) > 0 ? (
    var.cache_security_group_config.ingress_rules) : [
      {
        description = "Allow inbound cache traffic from the VPC"
        from_port   = var.cache_port
        to_port     = var.cache_port
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
      }
    ]
    egress_rules = try(length(var.cache_security_group_config.egress_rules), 0) > 0 ? (
    var.cache_security_group_config.egress_rules) : [
      {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [local.internet_cidr_block]
      }
    ]
  }
}