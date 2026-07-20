resource "aws_security_group" "tgfdelivery_bastion" {
  description = "Allow SSH inbound traffic and all outbound traffic"
  name        = "tgfdelivery_bastion_sg"
  vpc_id      = aws_vpc.tgfdelivery_vpc.id

  dynamic "ingress" {
    for_each = local.bastion_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.bastion_egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-bastion"
  })
}

resource "aws_security_group" "tgfdelivery_private_vm" {
  description = "Allow SSH inbound traffic and all outbound traffic"
  name        = "tgfdelivery_private_vm_sg"
  vpc_id      = aws_vpc.tgfdelivery_vpc.id

  dynamic "ingress" {
    for_each = local.private_vm_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.private_vm_egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-private-vm"
  })
}