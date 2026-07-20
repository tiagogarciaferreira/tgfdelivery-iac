locals {
  context_name      = "tgfdelivery"
  availability_mode = var.internet_gateway_availability_mode ? "regional" : "zonal"
}