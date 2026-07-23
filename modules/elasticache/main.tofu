resource "aws_elasticache_serverless_cache" "main" {
  description = "ElastiCache Serverless cluster for ${var.environment} environment."
  name        = "${var.context_name}-${var.environment}-cache"
  engine      = var.engine

  cache_usage_limits {
    data_storage {
      maximum = var.data_storage.maximum
      minimum = var.data_storage.minimum
      unit    = var.data_storage.unit
    }
    ecpu_per_second {
      maximum = var.ecpu_per_second.maximum
      minimum = var.ecpu_per_second.minimum
    }
  }
  daily_snapshot_time      = var.daily_snapshot_time
  major_engine_version     = var.major_engine_version
  snapshot_retention_limit = var.snapshot_retention_limit
  security_group_ids       = [aws_security_group.main.id]
  subnet_ids               = var.subnet_ids

  connection {
    port = var.port
  }

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-${var.environment}-cache"
  })
}