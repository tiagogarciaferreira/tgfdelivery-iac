module "msk" {
  source = "../../modules/msk"

  common_tags           = local.common_tags
  context_name          = local.context_name
  environment           = var.environment
  security_group_config = var.msk_security_group_config
  subnet_ids            = module.vpc.private_subnet_ids["management"]
  vpc_id                = module.vpc.vpc_id
}