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
  description = "The ID of the VPC where the MSK instance will be launched."
  type        = string
}

variable "subnet_ids" {
  description = "List of private VPC subnet IDs for the MSK."
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
