module "cache" {
  source = "../../modules/elasticache"

  common_tags              = local.common_tags
  context_name             = local.context_name
  daily_snapshot_time      = var.cache_daily_snapshot_time
  data_storage             = var.cache_data_storage
  ecpu_per_second          = var.cache_ecpu_per_second
  engine                   = var.cache_engine
  port                     = var.cache_port
  environment              = var.environment
  major_engine_version     = var.cache_major_engine_version
  security_group_config    = local.cache_security_group_config
  snapshot_retention_limit = var.cache_snapshot_retention_limit
  subnet_ids               = module.vpc.private_subnet_ids["management"]
  vpc_id                   = module.vpc.vpc_id
}