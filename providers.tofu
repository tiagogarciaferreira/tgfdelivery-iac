terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.54.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.9.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}