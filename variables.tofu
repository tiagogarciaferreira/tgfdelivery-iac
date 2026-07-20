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

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "tgfdelivery-vpc"
}

variable "public_subnet_config" {
  description = "Configuration for the public subnets."
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    "public_a" = {
      name              = "tgfdelivery-public-a"
      cidr_block        = "172.25.1.0/24"
      availability_zone = "a"
    },
    "public_b" = {
      name              = "tgfdelivery-public-b"
      cidr_block        = "172.25.2.0/24"
      availability_zone = "b"
    },
    "public_c" = {
      name              = "tgfdelivery-public-c"
      cidr_block        = "172.25.3.0/24"
      availability_zone = "c"
    }
  }
}