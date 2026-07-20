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
    "private_management_a" = {
      cidr_block        = "172.25.4.0/24"
      availability_zone = "a"
    },
    "private_management_b" = {
      cidr_block        = "172.25.5.0/24"
      availability_zone = "b"
    },
    "private_management_c" = {
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
    "private_cluster_a" = {
      cidr_block        = "172.25.7.0/24"
      availability_zone = "a"
    },
    "private_cluster_b" = {
      cidr_block        = "172.25.8.0/24"
      availability_zone = "b"
    },
    "private_cluster_c" = {
      cidr_block        = "172.25.9.0/24"
      availability_zone = "c"
    }
  }
}

variable "internet_gateway_availability_mode" {
  description = "The availability mode for the Internet Gateway is regional."
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

variable "bastion_ingress_rules" {
  description = "A list of ingress rules for the bastion security group."
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "bastion_egress_rules" {
  description = "A list of egress rules for the bastion security group."
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}


variable "private_vm_ingress_rules" {
  description = "A list of ingress rules for the private VM security group."
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "private_vm_egress_rules" {
  description = "A list of egress rules for the private VM security group."
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}