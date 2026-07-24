aws_region           = "us-east-1"
environment          = "production"
bucket_name          = "tgfdelivery-tfstate"
vpc_cidr_block       = "172.26.0.0/16"
enable_dns_hostnames = true
enable_dns_support   = true

public_subnets_config = {
  public = {
    "public_a" = { cidr_block = "172.26.1.0/24", availability_zone = "a" },
    "public_b" = { cidr_block = "172.26.2.0/24", availability_zone = "b" },
    "public_c" = { cidr_block = "172.26.3.0/24", availability_zone = "c" }
  }
}

private_subnets_config = {
  management = {
    "private_management_a" = { cidr_block = "172.26.4.0/24", availability_zone = "a" },
    "private_management_b" = { cidr_block = "172.26.5.0/24", availability_zone = "b" },
    "private_management_c" = { cidr_block = "172.26.6.0/24", availability_zone = "c" }
  },
  cluster = {
    "private_cluster_a" = { cidr_block = "172.26.7.0/24", availability_zone = "a" },
    "private_cluster_b" = { cidr_block = "172.26.8.0/24", availability_zone = "b" },
    "private_cluster_c" = { cidr_block = "172.26.9.0/24", availability_zone = "c" }
  },
  database = {
    "private_database_a" = { cidr_block = "172.26.10.0/24", availability_zone = "a" },
    "private_database_b" = { cidr_block = "172.26.11.0/24", availability_zone = "b" },
    "private_database_c" = { cidr_block = "172.26.12.0/24", availability_zone = "c" }
  }
}

nat_gw_availability_mode      = true
instance_type                 = "t3.micro"
key_pair_name                 = "tgfdelivery-production-key"
enabled_eip                   = true
bastion_security_group_config = null

db_subnet_group_name    = "tgfdelivery-production-db-subnet-group"
db_parameter_group_name = "tgfdelivery-production-db-parameter-group"
db_engine               = "postgres"
db_engine_version       = "18"
db_instance_class       = "db.t4g.micro"
db_port                 = 5432
db_name                 = "delivery"
db_username             = "postgres"
db_allocated_storage    = 10
db_skip_final_snapshot  = true

db_security_group_config = {
  name        = "tgfdelivery-production-database-sg"
  description = "Configuring security groups for DB instances."
  ingress_rules = [
    {
      description = "Allow inbound database traffic from the VPC"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["172.26.0.0/16"]
    }
  ]
  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

db_parameter_group_options = {
  "max_connections"          = "300"
  "shared_preload_libraries" = "pg_stat_statements,pgaudit"
}

db_apply_immediately    = false
backup_window           = "08:00-09:00"
backup_retention_period = 7
maintenance_window      = "Sat:03:00-Sat:07:00"

cache_engine                   = "valkey"
cache_port                     = 6379
cache_major_engine_version     = "9"
cache_daily_snapshot_time      = "05:00"
cache_snapshot_retention_limit = 1

cache_security_group_config = {
  name        = "tgfdelivery-production-cache-sg"
  description = "Configuring security groups for ElastiCache."
  ingress_rules = [
    {
      description = "Allow inbound cache traffic from the VPC"
      from_port   = 6379
      to_port     = 6379
      protocol    = "tcp"
      cidr_blocks = ["172.26.0.0/16"]
    }
  ]
  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

cache_data_storage = {
  maximum = 10
  minimum = 1
  unit    = "GB"
}
cache_ecpu_per_second = {
  maximum = 5000
  minimum = 1000
}

msk_port = 9098
msk_security_group_config = {
  name        = "tgfdelivery-production-msk-sg"
  description = "Configuring security groups for MSK."
  ingress_rules = [
    {
      description = "Allow inbound msk traffic from the VPC"
      from_port   = 9098
      to_port     = 9098
      protocol    = "tcp"
      cidr_blocks = ["172.26.0.0/16"]
    }
  ]
  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}