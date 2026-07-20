locals {
  context_name        = "tgfdelivery"
  availability_mode   = var.internet_gateway_availability_mode ? "regional" : "zonal"
  managed_by          = "OpenTofu"
  internet_cidr_block = "0.0.0.0/0"
  my_public_ip        = "${trimspace(data.http.my_public_ip.response_body)}/32"

  common_tags = {
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}