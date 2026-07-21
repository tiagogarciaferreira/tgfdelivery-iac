locals {
  internet_cidr_block = "0.0.0.0/0"

  merged_private_subnets = merge([
    for group_name, subnets in var.private_subnets_config : {
      for subnet_key, subnet in subnets : subnet_key => merge(subnet, { group = group_name })
    }
  ]...)

  merged_public_subnets = merge([
    for group_name, subnets in var.public_subnets_config : {
      for subnet_key, subnet in subnets : subnet_key => merge(subnet, { group = group_name })
    }
  ]...)
}