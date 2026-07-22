output "arn" {
  description = "ARN of the RDS instance."
  value       = aws_db_instance.main.arn
}

output "subnet_group_id" {
  description = "ID of the DB subnet group."
  value       = aws_db_subnet_group.main.id
}

output "engine" {
  description = "Database engine running on the instance."
  value       = aws_db_instance.main.engine
}

output "parameter_group_id" {
  description = "ID of the associated DB parameter group."
  value       = aws_db_parameter_group.main.id
}

output "security_group_id" {
  description = "ID of the associated security group."
  value       = aws_security_group.main.id
}

output "security_group_arn" {
  description = "ARN of the associated security group."
  value       = aws_security_group.main.arn
}

output "password_secret_arn" {
  description = "ARN of the Secrets Manager secret containing the master user password."
  value       = aws_db_instance.main.master_user_secret[0].secret_arn
}