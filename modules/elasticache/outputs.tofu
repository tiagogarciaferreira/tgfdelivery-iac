output "id" {
  description = "ID of the ElastiCache instance."
  value       = aws_elasticache_serverless_cache.main.id
}

output "arn" {
  description = "ARN of the ElastiCache instance."
  value       = aws_elasticache_serverless_cache.main.arn
}

output "engine" {
  description = "Engine of the ElastiCache instance."
  value       = aws_elasticache_serverless_cache.main.engine
}

output "security_group_id" {
  description = "ID of the associated security group."
  value       = aws_security_group.main.id
}

output "security_group_arn" {
  description = "ARN of the associated security group."
  value       = aws_security_group.main.arn
}

output "endpoint" {
  description = "Endpoint of the ElastiCache Serverless cache."
  value       = aws_elasticache_serverless_cache.main.endpoint
}