variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}

variable "context_name" {
  description = "The context name for the resources."
  type        = string
}

variable "environment" {
  description = "The environment to deploy resources (e.g., development, staging, production)."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the Elasticache instance will be launched."
  type        = string
}

variable "engine" {
  description = "The cache engine to use (e.g., redis, memcached, valkey)."
  type        = string
}

variable "port" {
  description = "The port number on which the cache accepts connections (e.g., 6379 for Redis, 11211 for Memcached)."
  type        = number
}

variable "major_engine_version" {
  description = "The major version of the cache engine (e.g., 7.1)."
  type        = string
}

variable "daily_snapshot_time" {
  description = "The daily time range in UTC for snapshots (e.g., 03:00-04:00)."
  type        = string
}

variable "snapshot_retention_limit" {
  description = "Number of days to retain automatic snapshots."
  type        = number
}

variable "subnet_ids" {
  description = "List of private VPC subnet IDs for the ElastiCache nodes."
  type        = list(string)
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

variable "data_storage" {
  description = "Minimum and maximum data storage limits for the serverless cache."
  type = object({
    maximum = number
    minimum = number
    unit    = string
  })
}

variable "ecpu_per_second" {
  description = "Minimum and maximum ElastiCache Processing Units (ECPU) per second for scaling."
  type = object({
    maximum = number
    minimum = number
  })
}