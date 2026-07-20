resource "tls_private_key" "tgfdelivery_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tgfdelivery_key_pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.tgfdelivery_private_key.public_key_openssh
}

resource "local_sensitive_file" "tgfdelivery_private_key" {
  content         = tls_private_key.tgfdelivery_private_key.private_key_pem
  filename        = "${path.module}/${var.key_pair_name}.pem"
  file_permission = "0400"
}

resource "aws_eip" "tgfdelivery_bastion_eip" {
  instance = aws_instance.tgfdelivery_bastion.id
  domain   = "vpc"

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-bastion-eip"
  })
}

resource "aws_instance" "tgfdelivery_bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.tgfdelivery_public["public_a"].id
  vpc_security_group_ids      = [aws_security_group.tgfdelivery_bastion.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-bastion"
  })

  depends_on = [aws_key_pair.tgfdelivery_key_pair]
}

resource "aws_instance" "tgfdelivery_private_vm" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.tgfdelivery_private_management["private_management_a"].id
  vpc_security_group_ids = [aws_security_group.tgfdelivery_private_vm.id]
  key_name               = var.key_pair_name

  tags = merge(local.common_tags, {
    Name = "${local.context_name}-private-vm"
  })

  depends_on = [aws_key_pair.tgfdelivery_key_pair]
}