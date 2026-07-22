variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment for the S3 bucket (e.g., development, homologation, production)."
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

variable "public_subnets_config" {
  description = "Configuration for the public subnets."
  type = map(
    map(object({
      cidr_block        = string
      availability_zone = string
    }))
  )
  default = {
    "public" = {
      "public_a" = { cidr_block = "172.26.1.0/24", availability_zone = "a" },
      "public_b" = { cidr_block = "172.26.2.0/24", availability_zone = "b" },
      "public_c" = { cidr_block = "172.26.3.0/24", availability_zone = "c" },
    }
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
    "management" = {
      "private_management_a" = { cidr_block = "172.26.4.0/24", availability_zone = "a" },
      "private_management_b" = { cidr_block = "172.26.5.0/24", availability_zone = "b" },
      "private_management_c" = { cidr_block = "172.26.6.0/24", availability_zone = "c" },
    },
    "cluster" = {
      "private_cluster_a" = { cidr_block = "172.26.7.0/24", availability_zone = "a" },
      "private_cluster_b" = { cidr_block = "172.26.8.0/24", availability_zone = "b" },
      "private_cluster_c" = { cidr_block = "172.26.9.0/24", availability_zone = "c" },
    }
    "database" = {
      "private_database_a" = { cidr_block = "172.26.10.0/24", availability_zone = "a" },
      "private_database_b" = { cidr_block = "172.26.11.0/24", availability_zone = "b" },
      "private_database_c" = { cidr_block = "172.26.12.0/24", availability_zone = "c" },
    }
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
  default = null
}