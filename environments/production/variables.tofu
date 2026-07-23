variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment to deploy resources. (e.g., development, homologation, production)."
  type        = string
  default     = "production"
}

variable "bucket_name" {
  description = "The name of the S3 state bucket."
  type        = string
  default     = "tgfdelivery-tfstate"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "172.26.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for resources within the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS resolution support in the VPC."
  type        = bool
  default     = true
}

variable "public_subnets_config" {
  description = "Configuration for the public subnets."
  type = map(
    map(object({
      cidr_block        = string
      availability_zone = string
    }))
  )
  default = {
    public = tomap({
      "public_a" = { cidr_block = "172.26.1.0/24", availability_zone = "a" },
      "public_b" = { cidr_block = "172.26.2.0/24", availability_zone = "b" },
      "public_c" = { cidr_block = "172.26.3.0/24", availability_zone = "c" },
    })
  }
}

variable "private_subnets_config" {
  description = "Configuration for the private subnets."
  type = map(
    map(object({
      cidr_block        = string
      availability_zone = string
    }))
  )
  default = {
    management = tomap({
      "private_management_a" = { cidr_block = "172.26.4.0/24", availability_zone = "a" },
      "private_management_b" = { cidr_block = "172.26.5.0/24", availability_zone = "b" },
      "private_management_c" = { cidr_block = "172.26.6.0/24", availability_zone = "c" },
    }),
    cluster = tomap({
      "private_cluster_a" = { cidr_block = "172.26.7.0/24", availability_zone = "a" },
      "private_cluster_b" = { cidr_block = "172.26.8.0/24", availability_zone = "b" },
      "private_cluster_c" = { cidr_block = "172.26.9.0/24", availability_zone = "c" },
    }),
    database = tomap({
      "private_database_a" = { cidr_block = "172.26.10.0/24", availability_zone = "a" },
      "private_database_b" = { cidr_block = "172.26.11.0/24", availability_zone = "b" },
      "private_database_c" = { cidr_block = "172.26.12.0/24", availability_zone = "c" },
    })
  }
}

variable "nat_gw_availability_mode" {
  description = "The availability mode for the NAT Gateway is regional."
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instances."
  type        = string
  default     = "tgfdelivery-key"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  type        = string
  default     = "ami-0b6d9d3d33ba97d99"
}

variable "enabled_eip" {
  description = "Whether to enable an Elastic IP for the EC2 instance."
  type        = bool
  default     = true
}

variable "bastion_security_group_config" {
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
  default = null
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group."
  type        = string
  default     = "tgfdelivery-production-db-subnet-group"
}

variable "db_parameter_group_name" {
  description = "Name of the DB parameter group."
  type        = string
  default     = "tgfdelivery-production-db-parameter-group"
}

variable "db_engine" {
  description = "Database engine to use (e.g., postgres, mysql)."
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Version of the database engine."
  type        = string
  default     = "18"
}

variable "db_instance_class" {
  description = "Instance type for the RDS instance (e.g., db.t3.micro, db.m5.large)."
  type        = string
  default     = "db.t4g.micro"
}

variable "db_port" {
  description = "Port on which the database accepts connections."
  type        = number
  default     = 5432
}

variable "db_name" {
  description = "Name of the initial database to create."
  type        = string
  default     = "delivery"
}

variable "db_username" {
  description = "Username for the database."
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "Allocated storage size in gigabytes (GB)."
  type        = number
  default     = 10
}

variable "db_skip_final_snapshot" {
  description = "Skip the creation of a final DB snapshot when destroying the instance."
  type        = bool
  default     = true
}

variable "db_security_group_config" {
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
  default = null
}

variable "db_parameter_group_options" {
  description = "Map of database parameters to configure in the parameter group."
  type        = map(string)
  default = {
    "max_connections"          = "300",
    "shared_preload_libraries" = "pg_stat_statements,pgaudit"
  }
}

variable "db_apply_immediately" {
  description = "Apply database modifications immediately instead of waiting for the next maintenance window."
  type        = bool
  default     = false
}

variable "backup_window" {
  description = "Daily time window during which automated backups are created (e.g., 03:00-04:00)."
  type        = string
  default     = "08:00-09:00"
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups."
  type        = number
  default     = 7
}

variable "maintenance_window" {
  description = "Weekly time window during which system maintenance can occur (e.g., sun:04:30-sun:05:30)."
  type        = string
  default     = "Sat:03:00-Sat:07:00"
}

variable "cache_engine" {
  description = "The cache engine to use (e.g., redis, memcached, valkey)."
  type        = string
  default     = "valkey"
}

variable "cache_port" {
  description = "The port number on which the cache accepts connections (e.g., 6379 for Redis, 11211 for Memcached)."
  type        = number
  default     = 6379
}

variable "cache_major_engine_version" {
  description = "The major version of the cache engine (e.g., 7.1)."
  type        = string
  default     = "9"
}

variable "cache_daily_snapshot_time" {
  description = "The daily time range in UTC for snapshots (e.g., 03:00-04:00)."
  type        = string
  default     = "05:00"
}

variable "cache_snapshot_retention_limit" {
  description = "Number of days to retain automatic snapshots."
  type        = number
  default     = 1
}

variable "cache_security_group_config" {
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

variable "cache_data_storage" {
  description = "Minimum and maximum data storage limits for the serverless cache."
  type = object({
    maximum = number
    minimum = number
    unit    = string
  })
  default = ({
    maximum = 10
    minimum = 1
    unit    = "GB"
  })
}

variable "cache_ecpu_per_second" {
  description = "Minimum and maximum ElastiCache Processing Units (ECPU) per second for scaling."
  type = object({
    maximum = number
    minimum = number
  })
  default = ({
    maximum = 5000
    minimum = 1000
  })
}

variable "msk_port" {
  description = "The port number on which the msk accepts connections (e.g., 9098)."
  type        = number
  default     = 9098
}

variable "msk_security_group_config" {
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
  default = null
}