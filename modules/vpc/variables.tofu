variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
}

variable "context_name" {
  description = "The context name for the resources."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnets_config"{
  description = "Configuration for the public subnets."
  type = map(
    map(object({
      cidr_block        = string
      availability_zone = string
    }))
  )
}

variable "private_subnets_config" {
  description = "Configuration for the private subnets."
  type = map(
    map(object({
      cidr_block        = string
      availability_zone = string
    }))
  )
}

variable "nat_gateway_availability_mode" {
  description = "The NAT Gateway's availability mode."
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
}