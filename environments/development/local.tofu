locals {
  context_name                  = "tgfdelivery"
  nat_gateway_availability_mode = var.nat_gw_availability_mode ? "regional" : "zonal"
  managed_by                    = "OpenTofu"
  internet_cidr_block           = "0.0.0.0/0"
  my_public_ip                  = "${trimspace(data.http.my_public_ip.response_body)}/32"
  short_environment             = "dev"

  common_tags = {
    Environment       = var.environment
    Short-Environment = local.short_environment
    ManagedBy         = local.managed_by
    Project           = local.context_name
  }

  bastion_security_group_config = {
    name        = "${local.context_name}-${var.environment}-bastion-sg"
    description = "Configuring security groups for EC2 instances."

    ingress_rules = coalesce(
      try(length(var.security_group_config.ingress_rules) == 0 ? null : var.security_group_config.ingress_rules, null),
      [
        {
          description = "Allow SSH from My IP"
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = [local.my_public_ip]
        }
      ]
    )
    egress_rules = coalesce(
      try(length(var.security_group_config.egress_rules) == 0 ? null : var.security_group_config.egress_rules, null),
      [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = [local.internet_cidr_block]
        }
      ]
    )
  }

  db_security_group_config = {
    name        = "${local.context_name}-${var.environment}-database-sg"
    description = "Configuring security groups for DB instances."

    ingress_rules = coalesce(
      try(length(var.db_security_group_config.ingress_rules) == 0 ? null : var.db_security_group_config.ingress_rules, null),
      [
        {
          description = "Allow SSH from My IP"
          from_port   = var.db_port
          to_port     = var.db_port
          protocol    = "tcp"
          cidr_blocks = [local.my_public_ip]
        }
      ]
    )
    egress_rules = coalesce(
      try(length(var.db_security_group_config.egress_rules) == 0 ? null : var.db_security_group_config.egress_rules, null),
      [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = [local.internet_cidr_block]
        }
      ]
    )
  }
}