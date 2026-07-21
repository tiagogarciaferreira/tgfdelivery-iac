module "bastion" {
  source = "./modules/ec2"

  context_name          = local.context_name
  common_tags           = local.common_tags
  subnet_id             = module.vpc.public_subnet_ids["public"][0]
  vpc_id                = module.vpc.vpc_id
  enabled_eip           = var.enabled_eip
  instance_name         = "${local.context_name}-bastion"
  instance_type         = var.instance_type
  key_pair_name         = var.key_pair_name
  ami_id                = data.aws_ami.ubuntu.id
  security_group_config = local.bastion_security_group_config
}