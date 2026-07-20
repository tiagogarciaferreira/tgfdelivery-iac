locals {
  context_name        = "tgfdelivery"
  availability_mode   = var.internet_gateway_availability_mode ? "regional" : "zonal"
  managed_by          = "OpenTofu"
  internet_cidr_block = "0.0.0.0/0"
  my_public_ip        = "${trimspace(data.http.my_public_ip.response_body)}/32"

  common_tags = {
    Environment = var.environment
    ManagedBy   = local.managed_by
  }

  bastion_ingress_rules = length(var.bastion_ingress_rules) > 0 ? var.bastion_ingress_rules : [
    {
      description = "Allow SSH from My IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [local.my_public_ip]
    }
  ]

  bastion_egress_rules = length(var.bastion_egress_rules) > 0 ? var.bastion_egress_rules : [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [local.internet_cidr_block]
    }
  ]

  private_vm_ingress_rules = length(var.private_vm_ingress_rules) > 0 ? var.private_vm_ingress_rules : [
    {
      description = "Allow SSH from VPC"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [aws_vpc.tgfdelivery_vpc.cidr_block]
    }
  ]

  private_vm_egress_rules = length(var.private_vm_egress_rules) > 0 ? var.private_vm_egress_rules : [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [local.internet_cidr_block]
    }
  ]
}