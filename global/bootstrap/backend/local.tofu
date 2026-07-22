locals {
  context_name = "tgfdelivery"
  managed_by   = "OpenTofu"
  environment  = "global"

  common_tags = {
    Project     = local.context_name
    Environment = local.environment
    ManagedBy   = local.managed_by
  }
}