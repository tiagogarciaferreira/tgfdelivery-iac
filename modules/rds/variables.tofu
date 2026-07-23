variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}

variable "context_name" {
  description = "The context name for the resources."
  type        = string
}

variable "environment" {
  description = "The environment for the S3 bucket (e.g., development, homologation, production)."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be launched."
  type        = string
}

variable "subnet_group_name" {
  description = "Name of the DB subnet group."
  type        = string
}

variable "subnet_ids" {
  description = "List of VPC subnet IDs for the database subnet group."
  type        = list(string)
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group."
  type        = string
}

variable "engine" {
  description = "Database engine to use (e.g., postgres, mysql)."
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine."
  type        = string
}

variable "instance_class" {
  description = "Instance type for the RDS instance (e.g., db.t3.micro, db.m5.large)."
  type        = string
  default     = "db.t4g.micro"
}

variable "port" {
  description = "Port on which the database accepts connections."
  type        = number
}

variable "db_name" {
  description = "Name of the initial database to create."
  type        = string
}

variable "username" {
  description = "Username for the database."
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage size in gigabytes (GB)."
  type        = number
}

variable "skip_final_snapshot" {
  description = "Skip the creation of a final DB snapshot when destroying the instance."
  type        = bool
}

variable "security_group_config" {
  description = "Configuration for the security groups."
  type = object({
    name        = string
    description = string
    ingress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}

variable "parameter_group_options" {
  description = "Map of database parameters to configure in the parameter group."
  type        = map(string)
}

variable "apply_immediately" {
  description = "Apply database modifications immediately instead of waiting for the next maintenance window."
  type        = bool
}

variable "backup_window" {
  description = "Daily time window during which automated backups are created (e.g., 03:00-04:00)."
  type        = string
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups."
  type        = number
}

variable "maintenance_window" {
  description = "Weekly time window during which system maintenance can occur (e.g., sun:04:30-sun:05:30)."
  type        = string
}