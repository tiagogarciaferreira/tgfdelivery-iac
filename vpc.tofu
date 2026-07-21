module "vpc" {
  source = "./modules/vpc"

  aws_region                    = var.aws_region
  context_name                  = local.context_name
  vpc_cidr_block                = var.vpc_cidr_block
  vpc_name                      = "${local.context_name}-vpc"
  public_subnets_config         = var.public_subnets_config
  private_subnets_config        = var.private_subnets_config
  nat_gateway_availability_mode = local.nat_gateway_availability_mode
  common_tags                   = local.common_tags
}