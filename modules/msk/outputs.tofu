output "id" {
  description = "ID of the MSK instance."
  value       = aws_msk_serverless_cluster.main.id
}

output "arn" {
  description = "ARN of the MSK instance."
  value       = aws_msk_serverless_cluster.main.arn
}

output "cluster_name" {
  description = "Name of the MSK cluster."
  value       = aws_msk_serverless_cluster.main.cluster_name
}

output "endpoint" {
  description = "Endpoint of the MSK Serverless."
  value       = aws_msk_serverless_cluster.main.bootstrap_brokers_sasl_iam
}

output "security_group_id" {
  description = "ID of the associated security group."
  value       = aws_msk_serverless_cluster.main.id
}

output "security_group_arn" {
  description = "ARN of the associated security group."
  value       = aws_msk_serverless_cluster.main.arn
}