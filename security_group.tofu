resource "aws_security_group" "tgfdelivery_bastion" {
  name        = "tgfdelivery_bastion_sg"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.tgfdelivery_vpc.id

  ingress {
    description = "SSH from My IP"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.internet_cidr_block]
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.internet_cidr_block]
  }

  tags = {
    Name        = "${local.context_name}-bastion"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_security_group" "tgfdelivery_private_vm" {
  name        = "tgfdelivery_private_vm_sg"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.tgfdelivery_vpc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.tgfdelivery_vpc.cidr_block]
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.internet_cidr_block]
  }

  tags = {
    Name        = "${local.context_name}-private-vm"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}