module "database" {
  source = "../../modules/rds"

  common_tags             = local.common_tags
  context_name            = local.context_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_group_name       = var.db_subnet_group_name
  subnet_ids              = module.vpc.private_subnet_ids["database"]
  parameter_group_name    = var.db_parameter_group_name
  parameter_group_options = var.db_parameter_group_options
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  port                    = var.db_port
  db_name                 = var.db_name
  username                = var.db_username
  allocated_storage       = var.db_allocated_storage
  security_group_config   = local.db_security_group_config
  skip_final_snapshot     = var.db_skip_final_snapshot
  apply_immediately       = var.db_apply_immediately
}