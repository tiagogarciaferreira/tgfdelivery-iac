variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment for the S3 bucket (e.g., development, homologation, production)."
  type        = string
  default     = "development"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "172.25.0.0/16"
}

# variable "vpc_name" {
#   description = "The name of the VPC."
#   type        = string
#   default     = "tgfdelivery-vpc"
# }

variable "public_subnet_config" {
  description = "Configuration for the public subnets."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    "public_a" = {
      cidr_block        = "172.25.1.0/24"
      availability_zone = "a"
    },
    "public_b" = {
      cidr_block        = "172.25.2.0/24"
      availability_zone = "b"
    },
    "public_c" = {
      cidr_block        = "172.25.3.0/24"
      availability_zone = "c"
    }
  }
}

variable "private_management_subnet_config" {
  description = "Configuration for the private management subnets."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    "public_a" = {
      cidr_block        = "172.25.4.0/24"
      availability_zone = "a"
    },
    "public_b" = {
      cidr_block        = "172.25.5.0/24"
      availability_zone = "b"
    },
    "public_c" = {
      cidr_block        = "172.25.6.0/24"
      availability_zone = "c"
    }
  }
}

variable "private_cluster_subnet_config" {
  description = "Configuration for the private cluster subnets."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    "public_a" = {
      cidr_block        = "172.25.7.0/24"
      availability_zone = "a"
    },
    "public_b" = {
      cidr_block        = "172.25.8.0/24"
      availability_zone = "b"
    },
    "public_c" = {
      cidr_block        = "172.25.9.0/24"
      availability_zone = "c"
    }
  }
}