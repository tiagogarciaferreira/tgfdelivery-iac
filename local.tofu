locals {
  context_name        = "tgfdelivery"
  availability_mode   = var.internet_gateway_availability_mode ? "regional" : "zonal"
  managed_by          = "OpenTofu"
  internet_cidr_block = "0.0.0.0/0"
}